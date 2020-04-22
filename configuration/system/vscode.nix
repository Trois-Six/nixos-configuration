{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        "artofshell.armsnippet"
        "bierner.github-markdown-preview"
        "bierner.markdown-checkbox"
        "bierner.markdown-emoji"
        "bierner.markdown-preview-github-styles"
        "bierner.markdown-yaml-preamble"
        "christian-kohler.npm-intellisense"
        "christian-kohler.path-intellisense"
        "dbaeumer.vscode-eslint"
        "drknoxy.eslint-disable-snippets"
        "editorconfig.editorconfig"
        "esbenp.prettier-vscode"
        "formulahendry.auto-rename-tag"
        "gamunu.vscode-yarn"
        "humao.rest-client"
        "ms-azuretools.vscode-docker"
        "ms-ceintl.vscode-language-pack-fr"
        "ms-python.python"
        "ms-vscode.go"
        "ms-vscode.powershell"
        "naumovs.color-highlight"
        "pkief.material-icon-theme"
        "richie5um2.vscode-sort-json"
        "wix.vscode-import-cost"
      ];
    })
  ];
}
