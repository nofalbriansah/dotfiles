{ config, pkgs, ... }:

{ 
  #nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;
   
  home.username = "nbs";
  home.homeDirectory = "/home/nbs";
  home.stateVersion = "24.05"; 
  
  home.packages = with pkgs;[
    font-awesome
    corefonts
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
   
    wget
    curl
    nixpkgs-fmt
    rmtrash
    zip
    unzip
    unrar
          
    btop
    nano
    tree
    speedtest-cli
    zoxide
    bat
    eza
    #kitty
    #neovim
    #helix

    gitui
    nodePackages_latest.nodejs
    hugo
    go
  ];
  
  programs.java.enable = false;
  programs.home-manager.enable = true;
  programs.thefuck.enable = true;
  programs.starship.enable = true;
   
  programs.git = {
    enable = true;
    userName  = "nofalbriansah";
    userEmail = "nofalbriansah@gmail.com";
  };
  programs.fish = {
      enable = true;
      interactiveShellInit = '' set fish_greeting # Disable greeting '';
      shellAbbrs = {
        #app
        cat = "bat";
        htop = "btop";
        ls = "eza";
        ll = "eza -l";
        rmt = "rmtrash";
        ff = "fastfetch";
        dev = "cd /mnt/data/data/development/coding";

        #apt
        au = "sudo apt update && sudo apt upgrade";
        ad = "sudo apt autoremove";
        fu = "flatpak update";

        #nix
        hmd = "nix-collect-garbage -d";
        hms = "home-manager switch";
        hmc = "nano /home/nbs/.config/home-manager/home.nix";
      };
  };
  programs.fastfetch = {
    enable = true;
    settings = {
      #schema = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      display = {
        size = {
          maxPrefix = "MB";
          ndigits = 0;
        };
      };
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "shell"
        {
            type = "display";
            compactType = "original";
            key = "Resolution";
        }
        "de"
        "wm"
        "wmtheme"
        "theme"
        "icons"
        "terminal"
        {
            type = "terminalfont";
            format = "{/2}{-}{/}{2}{?3} {3}{?}";
        }
        "cpu"
        {
            type = "gpu";
            key = "GPU";
        }
        {
            type = "memory";
            format = "{/1}{-}{/}{/2}{-}{/}{} / {}";
        }
        "break"
        "colors"
      ];
    };       
  };
}
