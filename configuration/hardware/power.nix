{ config, pkgs, ... }:

{
  powerManagement = {
    enable = true;
    powertop.enable = true;
  };
  services.upower.enable = true;
  services.tlp.enable = true;
}
