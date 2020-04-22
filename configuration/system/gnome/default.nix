{ pkgs, ... }:

{
  environment = {
    gnome3.excludePackages = with pkgs.gnome3; [
      accerciser
      epiphany
      gedit
      gnome-maps
      gnome-music
      gnome-photos
      gnome-software
      gnome-weather
      totem
      vinagre
    ];
    systemPackages = with pkgs; [
      gnome3.gnome-tweaks
      gnomeExtensions.dash-to-panel
      (callPackage ./bottom-panel.nix {})
      (writeScriptBin "red" ''
        x="$(gsettings get org.gnome.settings-daemon.plugins.color night-light-enabled)"
        [ "$x" = "true" ] && x=false || x=true
        echo "Nightlight: $x"
        gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled $x
      '')
      (writeScriptBin "hidebar" ''
        x="$(dconf read /org/gnome/shell/extensions/dash-to-panel/intellihide)"
        [ "$x" = "true" ] && x=false || x=true
        dconf write /org/gnome/shell/extensions/dash-to-panel/intellihide $x
      '')
    ];
  };

  programs.dconf.enable = true;
  services.gnome3.chrome-gnome-shell.enable = true;
}
