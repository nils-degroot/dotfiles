{ config, pkgs, system, ... }:

{
  home = {
    username = "nils";
    homeDirectory = "/home/nils";
    stateVersion = "22.11";

    packages = with pkgs; [
      # Tools
      xclip
      chezmoi

      # Util
      fd
      ripgrep
      rm-improved

      # Programming
      ## Tools
      gcc
      cargo
      rustc

      ## Language servers
      nil
      sumneko-lua-language-server
      rust-analyzer
      nodePackages_latest.grammarly-languageserver
      marksman

      ## Formatters
      stylua
      rustfmt

      # Gui
      ## Browsers
      qutebrowser
      firefox

      ## Etc
      alacritty
      rofi
      pavucontrol
      thunderbird
      cura
    ];
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    theme = { 
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-gtk;
    };
  };

  programs.git = {
    enable = true;
    userName = "nils-degroot";
    userEmail = "nils@peeko.nl";
    extraConfig = {
      pull.rebase = true;
    };
  };

  programs.neovim = {
    viAlias = true;
    vimAlias = true;
  };

  programs.zoxide.enable = true;

  programs.ncspot.enable = true;

  programs.password-store.enable = true;

  programs.tealdeer.enable = true;

  programs.bat.enable = true;

  programs.home-manager.enable = true;

  services.syncthing.enable = true;
}
