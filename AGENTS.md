# AGENTS.md

## What this repo is

NixOS configuration for Funk's ThinkPads, using flakes + home-manager.

## Structure

```
flake.nix                 # Flake entrypoint, defines hosts
hosts/thinknix-t460/      # ThinkPad T460 config + hardware scan
hosts/thinknix-t480/      # ThinkPad T480 config + hardware scan
modules/                  # NixOS system modules (kde, sound, networking, etc.)
home/                     # Home-manager config (programs, shell, fonts, KDE user config)
users/funk/               # Per-user nixos.nix + home.nix
```

## How to rebuild

```bash
sudo nixos-rebuild switch --flake ~/nix-config/#thinknix-t480
sudo nixos-rebuild switch --flake ~/nix-config/#thinknix-t460
```

## How to update packages

```bash
nix flake update
# then rebuild
```

## Conventions

- System-level modules go in `modules/`
- User-level config goes in `home/`
- Host-specific hardware in `hosts/<name>/hardware-configuration.nix`
- Both hosts use KDE Plasma 6 on Wayland (SDDM)
- GNOME module exists but is commented out on both hosts
- `pkgs-unstable` is only available on thinknix-t480 (passed via specialArgs)

## UI sluggishness investigation (2026-07-25)

**Hardware:** ThinkPad T480, i5-8250U, Intel UHD 620, 16GB RAM, NVMe, NixOS unstable, kernel 6.18.35, Mesa 26.1.2, KDE Plasma 6.6.5 on Wayland.

**Root cause:** Desktop compositor overhead on Intel iGPU. RAM/swap/disk were fine (3.3GB/16GB used, 0 swap).

**What we found:**
- KWin blur effect was actively compositing — `kwin_wayland` at ~11.7% CPU at idle (should be ~1-2%)
- Baloo file indexer running at 375MB RSS, eating CPU
- 26 KWin effects loaded
- Samba services (smbd/nmbd/winbindd) running, nmbd spamming "Network is unreachable" errors
- ModemManager running (no modem on this hardware)
- plasmashell at ~11% CPU, 430MB RSS

**Previous failed fix (commit 9b6165d):** Added `i915` to initrd + `vm.swappiness=10`. Didn't help because memory wasn't the bottleneck.

**Changes made:**
1. `modules/networking.nix` — Removed Samba (kept Avahi + cifs-utils)
2. `modules/system.nix` — Disabled ModemManager and Baloo via NixOS options
3. `home/config/kde.nix` — Added kwinrc config: disabled blur, set AnimationSpeed=0 (instant)

**Still pending rebuild + relogin** for kwinrc changes to take effect. After rebuild, kwin CPU should drop significantly.

**If still sluggish after rebuild:** Look into reducing loaded KWin effects further, checking plasmashell widget overhead, and investigating why plasmashell uses 11% CPU at idle.
