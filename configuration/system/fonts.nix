{ pkgs, ... }:

{
  fonts = {
    enableDefaultFonts = true;
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      dejavu_fonts
      liberation_ttf
      montserrat
      noto-fonts
      open-sans
      roboto
      terminus_font
      ubuntu_font_family
      unifont
      vistafonts
      winePackages.fonts
    ];
  };
}
