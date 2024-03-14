{ pkgs, outputs, inputs, username, ... }:

let 
  inherit (import ./options.nix)
    gitUsername
    gitEmail
    theme;
in {
  imports = [
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
      discord
      firefox
      htop
      neofetch
      (nerdfonts.override { fonts = [ "Mononoki" ]; })
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
  };
}