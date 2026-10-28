{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        clang
        cmake
        gnumake
        meson
        ninja
        zig
    ];
}
