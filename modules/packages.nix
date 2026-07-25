{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [

    # kde system apps
    kdePackages.kate
    kdePackages.konsole
    kdiskmark

    # admin / diagnostic tools
    usbutils
    ncdu
    lm_sensors
    hdparm
    lsof
    iotop
    screen
    smartmontools

    # developer tools (system-wide)
    uv
    opencode

    # filesystem tools
    hfsprogs
    exfatprogs
    testdisk
    testdisk-qt

    # image tools
    exiftool
    jhead

  ];

  # workaround to allow build with ventoy
  nixpkgs.config.permittedInsecurePackages = [
    "ventoy-1.1.12"
    "electron-39.8.10"
  ];

}
