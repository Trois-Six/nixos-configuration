{ pkgs, ... }:

{
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = true;
    challengeResponseAuthentication = true;
    forwardX11 = true;
  };

  programs.ssh.setXAuthLocation = true;
}
