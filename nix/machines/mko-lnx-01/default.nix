{ config, pkgs, lib, hostname, username, ... }:

{
  imports = [
    ../../modules/base.nix
    ../../modules/shell.nix
    ../../modules/desktop.nix
    ../../modules/packages.nix
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-d209b235-6b68-4da1-a569-ebd2659cd6a0".device = "/dev/disk/by-uuid/d209b235-6b68-4da1-a569-ebd2659cd6a0";

  networking.hostName = hostname;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.${username} = {
    isNormalUser = true;
    description = "Martin Korff";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      brave
      chromium
      cmus
      lazygit
      ollama
      opencode
      reaper
      renderdoc
      xwayland-satellite
      teams-for-linux
      thunderbird
      zig
    ];
  };

  system.stateVersion = "26.05";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-bak";
    users.${username} = {
      home.stateVersion = "26.05";
      xdg.configFile."eza/theme.yml".text = ''
        filenames:
          desktop:   { icon: { glyph: "" } }
          documents: { icon: { glyph: "󰲂" } }
          downloads: { icon: { glyph: "󰉍" } }
          movies:    { icon: { glyph: "󰿎" } }
          music:     { icon: { glyph: "󱍙" } }
          pictures:  { icon: { glyph: "󰉏" } }
          videos:    { icon: { glyph: "" } }
      '';

      programs.yazi = {
        enable = true;
        enableFishIntegration = true;
        theme.icon.prepend_dirs = [
          { name = "desktop";   text = ""; fg = "#00bcd4"; }
          { name = "documents"; text = ""; fg = "#00bcd4"; }
          { name = "downloads"; text = ""; fg = "#00bcd4"; }
          { name = "movies";    text = ""; fg = "#00bcd4"; }
          { name = "music";     text = ""; fg = "#00bcd4"; }
          { name = "pictures";  text = ""; fg = "#00bcd4"; }
          { name = "videos";    text = ""; fg = "#00bcd4"; }
        ];
      };

      xdg.userDirs = {
        enable = true;
        createDirectories = true;
        desktop = "/home/${username}/desktop";
        download = "/home/${username}/downloads";
        documents = "/home/${username}/documents";
        music = "/home/${username}/music";
        pictures = "/home/${username}/pictures";
        videos = "/home/${username}/videos";
        templates = "/home/${username}";
        publicShare = "/home/${username}";
        projects = "/home/${username}";
      };
    };
  };
}
