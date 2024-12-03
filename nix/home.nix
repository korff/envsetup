{ pkgs, ... }: {
# This is required information for home-manager to do its job
    home = {
        stateVersion = "24.05";
        username = "mko";
        homeDirectory = "/Users/mko";
        packages = [
            # tools
            pkgs.bat
            pkgs.binwalk
            pkgs.btop
            pkgs.cmus
            pkgs.curl
            pkgs.duf
            pkgs.fd
            pkgs.htop
            pkgs.hyperfine
            pkgs.lsd
            pkgs.ncdu
            pkgs.nmap
            pkgs.pass
            pkgs.ripgrep
            pkgs.stow
            pkgs.tldr

            # envirionment
            pkgs.tmux
            pkgs.wget
            pkgs.yazi
            pkgs.zoxide

            # developer
            pkgs.ccache
            pkgs.cmake
            pkgs.git
            pkgs.git-lfs
            pkgs.gnupg
            pkgs.lazygit
            pkgs.luarocks
            pkgs.meson
            pkgs.nasm
            pkgs.neovim
            pkgs.ninja
            pkgs.nodejs
            pkgs.rustup
            pkgs.tracy

            # lsps formats ...
            pkgs.bash-language-server
            pkgs.clang-tools
            pkgs.nil
            pkgs.nixpkgs-fmt
            pkgs.stylua
            pkgs.tree-sitter
            pkgs.yaml-language-server
            pkgs.yamllint
            pkgs.zig
            pkgs.zls

        ];
    };

    xdg.enable = true;

    programs.home-manager.enable = true;
}
