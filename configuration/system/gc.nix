{ config, pkgs, ... }:

{
  nix.gc.automatic = true;
  nix.optimise.automatic = true;
}
