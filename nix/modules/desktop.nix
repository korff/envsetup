{ config, pkgs, lib, ... }:

{
  programs.niri.enable = true;

  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };
}
