{ lib, pkgs, username, ...}:
let
  swww-script = import ./swww.nix { inherit pkgs username; };
in
{
    wayland.windowManager.hyprland = {
        enable = true;
        settings = {
            monitor = [
                "DP-1,1920x1080@144,0x290,1"
                    "DP-2,1920x1080@144,1920x0,1,transform,3"
            ];

            exec-once = [
                "swww init"
                swww-script
                "waybar"
            ];


            general = {
                "gaps_in" = "5";
                "gaps_out" = "10";
                "border_size" = "2";
                "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 60deg";
                "col.inactive_border" = "rgba(595959aa)";
                "allow_tearing" = "false";
            };

            misc = {
                "force_default_wallpaper" = "0";
            };

            "$mod" = "SUPER";

            bind = [
                "$mod, RETURN, exec, alacritty -e tmux"
                    "$mod, C, killactive, "
                    "$mod, M, exit, "
                    "$mod, D, exec, rofi -show drun"
                    "$mod, F, fullscreen, "
                    "$mod, V, togglefloating, "
                    "$mod, X, togglesplit, "

                    "$mod SHIFT, H, movewindow, l "
                    "$mod SHIFT, L, movewindow, r "
                    "$mod SHIFT, K, movewindow, u "
                    "$mod SHIFT, J, movewindow, d "

                    "$mod, H, movefocus, l"
                    "$mod, L, movefocus, r"
                    "$mod, K, movefocus, u"
                    "$mod, J, movefocus, d"

                    "$mod, Q, workspace, 1"
                    "$mod, W, workspace, 2"
                    "$mod, E, workspace, 3"
                    "$mod, R, workspace, 4"
                    "$mod, T, workspace, 5"
                    "$mod, Y, workspace, 6"
                    "$mod, U, workspace, 7"
                    "$mod, I, workspace, 8"
                    "$mod, O, workspace, 9"
                    "$mod, P, workspace, 10"

                    "$mod SHIFT, Q, movetoworkspace, 1"
                    "$mod SHIFT, W, movetoworkspace, 2"
                    "$mod SHIFT, E, movetoworkspace, 3"
                    "$mod SHIFT, R, movetoworkspace, 4"
                    "$mod SHIFT, T, movetoworkspace, 5"
                    "$mod SHIFT, Y, movetoworkspace, 6"
                    "$mod SHIFT, U, movetoworkspace, 7"
                    "$mod SHIFT, I, movetoworkspace, 8"
                    "$mod SHIFT, O, movetoworkspace, 9"
                    "$mod SHIFT, P, movetoworkspace, 10"

                    "$mod, S, togglespecialworkspace, magic"
                    "$mod SHIFT, S, movetoworkspace, special:magic"

                    "$mod, mouse_down, workspace, e+1"
                    "$mod, mouse_up, workspace, e-1"
                    ];

            bindm = [
                "$mod, mouse:272, movewindow"
                    "$mod, mouse:273, resizewindow"
            ];
        };
        extraConfig = "
            device {
                name=logitech-gaming-mouse-g502
                    accel_profile=flat
            }
        ";
    };
}
