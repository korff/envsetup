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
            pkgs.duf
            pkgs.eza
            pkgs.fd
            pkgs.fzf
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
            pkgs.nasm
            pkgs.neovim
            pkgs.ninja
            pkgs.nodejs
            pkgs.rustup
            pkgs.tracy
        ];
    };

    xdg.enable = true;

    programs.home-manager.enable = true;
    # programs.zsh = {
    #     enable = true;
    #     enableCompletion = true;
    #     autosuggestion.enable = true;
    #     syntaxHighlighting.enable = true;
    #
    #     shellAliases = {
    #         ll = "ls -l";
    #     };
    # };
}
