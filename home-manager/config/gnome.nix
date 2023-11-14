{ config, pkgs, stdenv, lib, ... }:

{
   home.packages = with pkgs; [

      # Gnome specific
      gnome.gnome-tweaks 

      # extensions
      gnomeExtensions.dash-to-dock
   ];

   # programs.dconf.enabled = true;

   dconf.settings = {

      "org/gnome/desktop/wm/preferences" = {
         button-layout = "close,minimize,maximize:appmenu";
         num-workspaces = 1;
      };

      "org/gnome/shell" = {
         disable-user-extensions = false;

         enable-extensions = [
            "appindicatorsupport@rgcjonas.gmail.com"
            "dash-to-dock@micxgx.gmail.com"
            "user-theme@gnome-shell-extensions.gcampax.github.com"
         ];
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        custom-theme-shrink = true;
        scroll-action = "cycle-windows";
        click-action = "skip";
        show-mounts = false;
        show-trash = false;
        show-show-apps-button = false;
        running-indicator-style = "DOTS";
        hot-keys = false;
      };
   };
}