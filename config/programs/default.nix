{ pkgs, config, username, ... }:

{
  imports = [
    ./alacritty.nix
    ./bash.nix
    ./hyprland.nix
    ./waybar.nix
    ./neovim.nix
  ];
}
