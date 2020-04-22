{ config, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.tmpOnTmpfs = true;

  # Enable zfs
  boot.initrd.supportedFilesystems = [ "zfs" ];
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.enableUnstable = true;

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Update CPU firmware at startup
  hardware.cpu.intel.updateMicrocode = true;

  # Disable swap most of the time
  boot.kernel.sysctl = {
    "vm.swappiness" = 1;
  };

  # Blacklist pcspkr
  boot.blacklistedKernelModules = [ "snd_pcsp" ];
}
