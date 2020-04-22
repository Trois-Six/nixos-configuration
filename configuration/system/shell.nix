{ pkgs, ... }:

let
  shellAliases = {
    ls = "ls --color=auto";
    ll = "ls -l";
    l = "ls -CF";
    k = "kubectl";
  };

in
{
  programs.bash = {
    vteIntegration = true;
    inherit shellAliases;
  };

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    vteIntegration = true;
  };
}
