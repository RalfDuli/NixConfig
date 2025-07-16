{config, pkgs, ...}: {
  imports = [];

  #home.username = "ralfd";
  #home.homeDirectory = "/home/ralfd";

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
    echo "Terminal starting!"
    '';

    shellAliases = {
      ff = "fastfetch";
      vim = "nvim";
    };
  };

  programs.kitty = {
    enable = true;
  };
 
  programs.home-manager.enable = true;
}
