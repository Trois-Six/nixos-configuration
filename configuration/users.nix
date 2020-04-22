{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.foo = {
    uid = 1000;
    isNormalUser = true;
    description = "Foo Bar";
    extraGroups = [ "audio" "dialout" "docker" "libvirtd" "lp" "systemd-journal" "video" "wheel" "wireshark" ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3...== foo.bar@example.org"
    ];
  };
}
