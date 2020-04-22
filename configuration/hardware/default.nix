{ config, pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./network.nix
    ./opengl.nix
    ./power.nix
    ./sound.nix
    ./virtualisation.nix
    ./x.nix
  ];
}
