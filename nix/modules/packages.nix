{ config, pkgs, ... }:

let
  # btop dlopens libnvidia-ml.so.1 by soname for GPU monitoring, but nothing
  # puts /run/opengl-driver/lib on its search path
  btopPkg = pkgs.btop.overrideAttrs (old: {
    nativeBuildInputs = old.nativeBuildInputs ++ [ pkgs.makeWrapper ];
    postInstall = (old.postInstall or "") + ''
      wrapProgram $out/bin/btop --prefix LD_LIBRARY_PATH : /run/opengl-driver/lib
    '';
  });
in
{
  environment.systemPackages = with pkgs; [
    alacritty
    bat
    btopPkg
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
