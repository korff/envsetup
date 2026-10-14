{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
    bat
    btop
    eza
    fd
    fzf
    git
    git-lfs
    ripgrep
    stow
    tmux
    vim
    wget
    yazi
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-mono
    nerd-fonts.noto
  ];
}
