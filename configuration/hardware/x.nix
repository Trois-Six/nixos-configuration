{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  services.xserver = {
    enable = true;
    layout = "fr";

    desktopManager.gnome3.enable = true;
    desktopManager.xterm.enable = false;

    libinput.enable = true;

    displayManager = {
      gdm.enable = true;
      gdm.wayland = true;
      defaultSession = "gnome";
    };
  };
}
