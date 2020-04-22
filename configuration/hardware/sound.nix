{ config, pkgs, ... }:

{
  # Enable sound.
  sound.enable = true;

  hardware.pulseaudio = {
    enable = true;
    extraModules = [ pkgs.pulseaudio-modules-bt ];
    package = pkgs.pulseaudioFull;
  };

  environment.variables.MPD_HOST = "mpd_host";
  environment.variables.MPD_PORT = "6600";
}
