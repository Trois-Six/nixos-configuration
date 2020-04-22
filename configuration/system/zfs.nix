{ pkgs, ... }:

{
  # Enable zfs.
  services.zfs = {
    autoSnapshot.enable = true;
    autoScrub.enable = true;
    trim.enable = true;
  };
}
