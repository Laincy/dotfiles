{
  config,
  pkgs,
  self,
  ...
}: {
  imports = [
    ./unfree
    ./shell

    ./alacritty.nix
    ./firefox.nix
		./foliate.nix
    ./prism.nix
    ./sober.nix
    ./tmux.nix
    ./tofi.nix
  ];

  home = {
    persistence."/persist/home/${config.home.username}".files = [
      ".config/gh/hosts.yml"
    ];
    packages = [
      self.packages.${pkgs.system}.nvim
      pkgs.inkscape
    ];
  };

  programs = {
    git = {
      enable = true;

      extraConfig.init.defaultBranch = "main";

      userName = "laincy";
      userEmail = "laincy@proton.me";
    };

    gh = {
      enable = true;

      settings = {
        version = "1";
        git_protocol = "https";
        prompt = "enabled";
      };
    };
    btop.enable = true;
  };
}
