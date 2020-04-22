{ config, pkgs, ... }:

{
  # Locale
  i18n = {
    defaultLocale = "fr_FR.UTF-8";
  };

  # Keyboard layout
  console = {
    keyMap = "fr";
    font = "Lat2-Terminus16";
  };

  # Time zone
  services.timesyncd.enable = true;
  time.timeZone = "Europe/Paris";
}
