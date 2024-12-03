{ ... }:
{
    imports = [
        ./eza.nix
        ./bat.nix
    ];

    programs.zoxide.enable = true;
}
