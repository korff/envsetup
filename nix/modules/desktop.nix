{ config, pkgs, lib, username, envsetupRoot, ... }:

{
  programs.niri.enable = true;

  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };

  system.activationScripts.stow-desktop-configs = ''
    for pkg in niri noctalia; do
      src="${envsetupRoot}/$pkg/$pkg"
      target="/home/${username}/.config/$pkg"
      [ -d "$src" ] || continue

      if [ -L "$target" ]; then
        raw="$(readlink "$target")"
        case "$raw" in
          *"/nix/store/"*)
            if [ "$(realpath -m -- "$target")" = "$(realpath -m -- "$src")" ]; then
              continue
            fi
            ;;
          *)
            continue
            ;;
        esac
      fi

      rm -rf "$target"
      ${pkgs.stow}/bin/stow --target="/home/${username}/.config" --dir="${envsetupRoot}" "$pkg"
    done
  '';
}
