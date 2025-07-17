{config, pkgs, ...}: {
  imports = [];

  home.packages = with pkgs; [
    fastfetch
  ];

  home.sessionVariables = {
    EDITOR = "vim";  
  };

  home.stateVersion = "25.05";
 
  programs.git = {
    enable = true;
    userName = "RalfDuli";
    userEmail = "ralfduli24@gmail.com";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
    fastfetch
    '';

    shellAliases = {
      ff = "fastfetch";
      vim = "nvim";
    };
  };

  programs.neovim = {
    enable = true; 
  };  

  programs.kitty = {
    enable = true;
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
    ];
  };

  # Desktop environment configuration

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      bind =
        [
          "$mod, B, exec, brave"
          ", Print, exec, grimblast copy area"
        ]
    };
  };
  
  programs.waybar = {
    enable = true;
    style = ''

    '';
  };

  programs.wofi = {
    enable = true;
  };
 
  programs.home-manager.enable = true;
}
