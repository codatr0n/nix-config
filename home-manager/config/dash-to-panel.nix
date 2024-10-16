# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/shell/extensions/dash-to-panel" = {
      animate-appicon-hover-animation-extent = {
        RIPPLE = 4;
        PLANK = 4;
        SIMPLE = 1;
      };
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
