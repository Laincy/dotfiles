{pkgs, ...}: let
  brightness = "${pkgs.brightnessctl}/bin/brightnessctl";
  av_device = "@DEFAULT_AUDIO_SINK@";
in {
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mod, q, exec, $terminal"
      "$mod, r, exec, $menu"
      "$mod, b, exec, $browser"

      "$mod, c, killactive"
      "$mod, l, exit"
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"

      "$mod, h, movefocus, l"
      "$mod, j, movefocus, d"
      "$mod, l, movefocus, r"
      "$mod, k, movefocus, u"

      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 10"
    ];

    bindle = [
      # Audio
      ",XF86AudioMute, exec, wpctl set-mute ${av_device} toggle"
      ",XF86AudioRaiseVolume, exec, wpctl set-volume ${av_device} 5%+ -l 1.0"
      ",XF86AudioLowerVolume, exec, wpctl set-volume ${av_device} 5%-"

      # Brightness
      ",XF86MonBrightnessUp, exec, ${brightness} set 5%+"
      ",XF86MonBrightnessDown, exec, ${brightness} set 5%-"
    ];
  };
}
