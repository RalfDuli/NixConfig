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



  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind =
      [
        "$mod, F, exec, firefox"
        ", Print, exec, grimblast copy area"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );
  };

  programs.wofi = {
    enable = true;
    settings = {

    };
    style = ''

    '';
  };

  programs.waybar = {
    enable = true;
    settings = {

    };
    style = ''

    '';
  };
 
  programs.home-manager.enable = true;
}
