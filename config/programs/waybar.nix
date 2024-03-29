{config, pkgs, ...}:
{
  programs.waybar = {
    enable = true;
  
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        
        modules-left = [
          "hyprland/workspaces"
          "custom/right-arrow-dark"
        ];
        
        modules-center = [
          "custom/left-arrow-dark"
          "clock#1"
          "custom/left-arrow-light"
          "custom/left-arrow-dark"
          "clock#2"
          "custom/right-arrow-dark"
          "custom/right-arrow-light"
          "clock#3"
          "custom/right-arrow-dark"
        ];

        modules-right = [
          "custom/left-arrow-dark"
          "pulseaudio"
          "custom/left-arrow-light"
          "custom/left-arrow-dark"
          "memory"
          "custom/left-arrow-light"
          "custom/left-arrow-dark"
          "cpu"
          "custom/left-arrow-light"
          "custom/left-arrow-dark"
          "disk"
          "custom/left-arrow-light"
          "custom/left-arrow-dark"
          "tray"
        ];

        "custom/left-arrow-dark" = {
          format = "";
          tooltip = false;
        };

        "custom/left-arrow-light" = {
          format = "";
          tooltip = false;
        };

        "custom/right-arrow-dark" = {
          format = "";
          tooltip = false;
        };

        "custom/right-arrow-light" = {
          format = "";
          tooltip = false;
        };

        "hyprland/workspaces" = {
          format = "{name}";
        };

        "clock#1" = {
          format = " {:%a} ";
          tooltip = false;
        };

        "clock#2" = {
          format = " {:%H:%M} ";
          tooltip = false;
        };

        "clock#3" = {
          format = " {:%d-%m} ";
          tooltip = false;
        };

        "pulseaudio" = {
          format = " {icon} {volume:2}% ";
          format-bluetooth = " {icon} {volume}% ";
          format-muted = "MUTE";
          format-icons = {
            headphones = "";
            default = [
              ""
              ""
            ];
          };
          scroll-step = "1";
          on-click = "pamixer -t";
          on-click-right = "pavucontrol";
        };

        "memory" = {
          interval = "5";
          format = " Mem {}% ";
        };

        "cpu" = {
          interval = "5";
          format = " CPU {usage:2}% ";
        };

        "disk" = {
          interval = "5";
          format = " Disk {percentage_used:2}% ";
          path = "/";
        };

        tray = {
          icon-size = "14";
        };
      };
    };

    style = "
* {
	font-size: 14px;
	font-family: Mononoki Nerd Font Mono;
}

window#waybar {
	background: #292b2e;
	color: #fdf6e3;
}

#custom-right-arrow-dark,
#custom-left-arrow-dark {
	font-size: 20px;
	color: #1a1a1a;
}
#custom-right-arrow-light,
#custom-left-arrow-light {
	font-size: 20px;
	color: #292b2e;
	background: #1a1a1a;
}

#workspaces,
#clock.1,
#clock.2,
#clock.3,
#pulseaudio,
#memory,
#cpu,
#disk,
#tray {
	background: #1a1a1a;
}

#workspaces button {
	padding: 0 0px;
	color: #fdf6e3;
}
#workspaces button.focused {
	color: #268bd2;
}
#workspaces button:hover {
	box-shadow: inherit;
	text-shadow: inherit;
}
#workspaces button:hover {
	background: #1a1a1a;
	border: #1a1a1a;
	padding: 0 0px;
}

#pulseaudio {
	color: #268bd2;
}
#memory {
	color: #2aa198;
}
#cpu {
	color: #6c71c4;
}
#disk {
	color: #b58900;
}

#clock,
#pulseaudio,
#memory,
#cpu,
#disk {
	padding: 0 0px;
}";
  };
}
