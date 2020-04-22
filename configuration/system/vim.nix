{ pkgs, ... }:

{
  environment.variables = { EDITOR = "vim"; };

  environment.systemPackages = with pkgs; [
    ((vim_configurable.override { python = python3; }).customize{
      name = "vim";
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [ vim-nix vim-lastplace ];
        opt = [];
      };
      vimrcConfig.customRC = ''
      syntax on
      filetype on
      set autoindent
      set background=dark
      set bs=2
      set expandtab
      set hlsearch
      set ignorecase
      set mouse=
      set nolbr
      set ruler
      set shiftwidth=2
      set showcmd
      set showmatch
      set smartcase
      set smartindent
      set tabstop=2
      '';
    }
  )];
}
