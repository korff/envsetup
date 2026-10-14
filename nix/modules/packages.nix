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
    nerd-fonts.caskaydia-mono
    nerd-fonts.noto
    ripgrep
    stow
    tmux
    vim
    wget
    yazi
  ];
}
