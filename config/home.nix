{ pkgs, outputs, inputs, username, ... }:
let 
  inherit (import ./options.nix)
    gitUsername
    gitEmail
    theme;
in {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./programs
  ];

  fonts.fontconfig.enable = true;

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
  
    packages = with pkgs; [
      alacritty
      aseprite
      bitwig-studio
      blender
      discord
      firefox
      htop
      llvm
      neofetch
      (nerdfonts.override { fonts = [ "Mononoki" ]; })
      qbittorrent
      qpwgraph
      rofi-wayland
      rustup
      swww
      terminus-nerdfont
      tmux
      unzip
      vim
      waybar
      wireplumber
      woeusb
      yabridge
    ];
  };

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "${gitUsername}";
      userEmail = "${gitEmail}";
    };
    nixvim = {
        enable = true;
    };
  };
}
