{ config, lib, pkgs, inputs, username, hostname, ... }:
let
  inherit (import ../config/options.nix)
    locale timezone gitUsername theme;
in {
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    supportedFilesystems = ["ntfs"];
    tmp.cleanOnBoot = true;
    loader = {
      efi = {
        canTouchEfiVariables = true;
      };
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
      };
    };
  };

  time.timeZone = "${timezone}";

  i18n.defaultLocale = "${locale}";

  sound.enable = true;
  hardware = {
    pulseaudio.enable = false;
    bluetooth.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  users.users."${username}" = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  programs = {
    steam = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    git
    wget
  ];

  services.getty.autologinUser = "${username}";
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  services.resolved.enable = true;

  networking = {
    hostName = "${hostname}";
    nameservers = [ "192.168.0.12" ];
    firewall = {
      enable = true;
    };
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
  };

  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L"
    ];
    dates = "09:00";
    randomizedDelaySec = "45min";
  };

  system.stateVersion = "23.11";
}

