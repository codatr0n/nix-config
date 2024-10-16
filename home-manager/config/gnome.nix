{ config, pkgs, stdenv, lib, ... }:

{

  dconf.enable = true;

  home.packages = with pkgs; [

    # Gnome specific
    dconf2nix
    gnome.dconf-editor
    gnome.gnome-tweaks
    gnome-extensions-cli

    # extensions
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-panel
    gnomeExtensions.system-monitor
    gnomeExtensions.tailscale-qs
  ];

  dconf.settings = {

    "org/gnome/desktop/wm/preferences" = {
        button-layout = "close,minimize,maximize:appmenu";
        num-workspaces = 1;
    };

    "org/gnome/desktop/interface" = {
      clock-show-weekday = false;
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "dash-to-panel@jderose9.github.com"
        "system-monitor@gnome-shell-extensions.gcampax.github.com"
        "appindicatorsupport@rgcjonas.gmail.com"
        "tailscale@joaophi.github.com" # tailscale qs
      ];
      disabled-extensions = [ ];
    };

    "org/gnome/shell/extensions/dash-to-panel" = {
      appicon-margin = 4;
      appicon-padding = 4;
      available-monitors = [ 0 ];
      dot-color-dominant = true;
      dot-color-override = false;
      dot-position = "BOTTOM";
      dot-style-focused = "DOTS";
      dot-style-unfocused = "DOTS";
      focus-highlight-dominant = true;
      hot-keys = true;
      hotkeys-overlay-combo = "TEMPORARILY";
      leftbox-padding = -1;
      panel-anchors = ''
        {"0":"MIDDLE"}
      '';
      panel-lengths = ''
        {"0":100}
      '';
      panel-sizes = ''
        {"0":32}
      '';
      primary-monitor = 0;
      status-icon-padding = -1;
      trans-panel-opacity = 0.8;
      trans-use-custom-opacity = true;
      tray-padding = -1;
      window-preview-title-position = "TOP";
    };
  };
}
