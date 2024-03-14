{ pkgs, config, lib, ... }:

let 
  palette = config.colorScheme.palette;
in {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding.x = 10;
	padding.y = 10;
	opacity = 0.6;
      };

      cursor = {
        style = {
          shape = "Beam";
          blinking = "On";
        };
      };
      font = {
        normal.family = "Mononoki Nerd Font Mono";
        bold.family = "Mononoki Nerd Font Mono";
        italic.family = "Mononoki Nerd Font Mono";
        bold_italic.family = "Mononoki Nerd Font Mono";
      };
    };
  };
}
