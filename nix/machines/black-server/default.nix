{ config, pkgs, lib, hostname, username, ... }:

{
  imports = [
    ../../modules/base.nix
    ../../modules/shell.nix
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # GPU compute only; no desktop session is enabled.
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
  };

  networking.hostName = hostname;

  # Remote administration over SSH.
  services.openssh = {
    enable = true;
    openFirewall = true;
  };

  # Headless server: drop the audio, printing, and browser bits from base.nix.
  services.pipewire.enable = lib.mkForce false;
  security.rtkit.enable = lib.mkForce false;
  services.printing.enable = lib.mkForce false;
  programs.firefox.enable = lib.mkForce false;

  # shell.nix configures a Wayland terminal, which is not needed here.
  programs.foot.enable = lib.mkForce false;

  # Access to old Windows/external disks on demand over SSH.
  services.udisks2.enable = true;
  boot.supportedFilesystems = [ "ntfs3" "exfat" "vfat" "ext4" "btrfs" ];
  boot.kernelModules = [ "ntfs3" "exfat" ];

  environment.systemPackages = with pkgs; [
    btop
    dosfstools
    eza
    exfatprogs
    fzf
    git
    gptfdisk
    hdparm
    nvme-cli
    ntfs3g
    parted
    ripgrep
    smartmontools
    tmux
    udisks2
    yazi
  ];

  users.users.${username} = {
    isNormalUser = true;
    description = "Martin Korff";
    extraGroups = [ "networkmanager" "wheel" "disk" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      lazygit
      ollama
      opencode
      zig
    ];
  };

  system.stateVersion = "26.05";
}
