{config, pkgs, ...}:

{
home.username = "ralfd";
home.homeDirectory = "/home/ralfd";
home.stateVersion = "24.05";

programs.home-manager.enable = true;

programs.hyprland = {
  enable = true;
  settings = {
    "$mod" = "SUPER";
    bind = [
      "$mod, RETURN, exec, kitty"
      "$mod, R, exec, wofi --show drun"
      "$mod, Q, killactive"
      "$mod, H, movefocus, l"
      "$mod, L, movefocus, r"
      "$mod, K, movefocus, u"
      "$mod, J, movefocus, d"
      "$mod SHIFT, SPACE, toggleFloating"
      "$mod SHIFT, E, exit"
    ];

    exec-once = [
      "waybar",
      "mako",
      "hyprpaper"
    ];

    input = {
     kb_layout = "us";
     follow_mouse = 1; 
    };

    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
    };
  };
};

programs.kitty = {
  enable = true;
  theme = "Dracula";
};

programs.wofi = {
  enable = true;
  settings = {
    prompt = "Search...";
  };
};

programs.waybar = {
  enable = true;
};

services.mako = {
  enable = true;
  defaultTimeout = 5000;
};

home.packages = with pkgs; [
 hyprpaper
 firefox 
];
}
