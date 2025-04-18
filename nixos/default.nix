{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./localization.nix
    ./user.nix
    ./theme.nix
    ./utils.nix

    ./explode
  ];

  system.stateVersion = "24.05";
  nix.settings.experimental-features = ["nix-command" "flakes"];

  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;
      copyKernels = true;
      device = "nodev";

      extraEntries = ''
        menuentry "Firmware Interface" {
            fwsetup
        }
      '';
    };
    efi.canTouchEfiVariables = true;
  };

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  services.greetd = {
    enable = true;
    settings = let
      session = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/Hyprland";
    in {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd ${session}";
        user = "greeter";
      };
    };
  };

  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
  # Cache for Hyprland
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
}
