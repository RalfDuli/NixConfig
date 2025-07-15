{config, pkgs, lib, ...}: {
  imports = []

  home.username = "ralfd";
  home.homeDirectory = "/home/ralfd";

   home.sessionVariables = {
    EDITOR = "vim";  
  };

  home.stateVersion = "25.05";

  users.defaultUserShell = pkgs.kitty;
 
  programs.git = {
    enable = true;
    userName = "RalfDuli";
    userEmail = "ralfduli24@gmail.com";
  };
 
  programs.home-manager.enable = true;
}
