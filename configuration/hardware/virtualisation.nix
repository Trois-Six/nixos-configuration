{ config, pkgs, ... }:

{
  boot.kernelModules = [ "kvm-intel" ];

  virtualisation.docker = {
    enable = true;
    # storageDriver = "zfs"; # Not sure of the benefits of this...
  };

  virtualisation.libvirtd = {
    enable = true;
  };

  environment.variables.LIBVIRT_DEFAULT_URI = "qemu:///system";
}
