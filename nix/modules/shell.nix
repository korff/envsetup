{ config, pkgs, ... }:

{
  programs.foot = {
    enable = true;
    enableFishIntegration = true;
    theme = "material-design";
    settings = {
      main = {
        term = "xterm-256color";
        font = "CaskaydiaMono Nerd Font:size=12";
      };
      csd = {
        preferred = "none";
      };
      cursor = {
        style = "block";
      };
    };
  };

  programs.fzf = {
    keybindings = true;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -U fish_greeting ""
    '';
    shellAliases = {
      ls = "eza --icons=always";
      ll = "eza -l --icons=always";
      la = "eza -la --icons=always";
      cat = "bat --style=plain";
      top = "btop";
      gss = "git status -s";
      gsu = "git submodule update";
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
