{ pkgs, ... }:

{
  #programs.git = {
  #  enable = true;
  #  userName = "Foo Bar";
  #  userEmail = "foo.bar@example.org";
  #  package = pkgs.gitAndTools.gitFull;
  #  aliases = {
  #    co = "checkout";
  #    ci = "commit";
  #    cp = "commit -p";
  #    s = "status";
  #    st = "status";
  #    d = "diff";
  #    pr = "pull --rebase";
  #    l = "log --graph --pretty='%Cred%h%Creset - %C(bold blue)<%an>%Creset %s%C(yellow)%d%Creset %Cgreen(%cr)' --abbrev-commit --date=relative";
  #    spull = "!__git_spull() { git pull \"$@\" && git submodule sync --recursive && git submodule update --init --recursive --merge; }; __git_spull";
  #    spush = "push --recurse-submodules=on-demand";
  #  };
  #};
}
