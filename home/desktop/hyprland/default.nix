{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./utils.nix
    ./binds.nix
  ];

  home = {
    sessionVariables = {
      NIXOS_OZONE_WL = 1;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;

    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;

    settings = {
      monitor = [
        "eDP-1, 2048x1280@120, 0x0, 1.0"
        "HDMI-A-1, 1920x1080@120, 2048x0, 1.0"
      ];

      input.touchpad.natural_scroll = true;

      "$mod" = "SUPER";
      "$terminal" = "alacritty";
      "$menu" = "wofi -S drun";
      "$browser" = "firefox";

      general = {
        layout = "master";
        border_size = 2;
      };

      decoration = {
        rounding = 0;
      };
    };
  };
}
