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
    echo ""
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
 
  programs.home-manager.enable = true;
}
