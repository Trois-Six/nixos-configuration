{ pkgs, ... }:

{
  services.journald.extraConfig = "SystemMaxUse=500M";
}
