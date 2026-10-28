{ config, pkgs, lib, hostname, username, ... }:

{
  imports = [
    ../../modules/base.nix
    ../../modules/shell.nix
    ../../modules/desktop.nix
    ../../modules/packages.nix
    ../../modules/development.nix
    ./hardware-configuration.nix
  ];

  boot.loader.limine = {
    enable = true;
    efiSupport = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false;
    nvidiaSettings = true;
  };

  networking.hostName = hostname;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.udisks2.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    description = "Martin Korff";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      brave
      cmus
      lazygit
      librewolf
      ollama
      opencode
      reaper
      renderdoc
      signal-desktop
      xwayland-satellite
      teams-for-linux
      thunderbird
      ungoogled-chromium
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
