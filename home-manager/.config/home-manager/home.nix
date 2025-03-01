{ config, pkgs, ... }:

{
  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;

  # Set up the user and home directory configuration
  home.username = "nbs";
  home.homeDirectory = "/home/nbs";
  home.stateVersion = "24.11";

  # Path Bash and Fish
  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/bin"
    "$HOME/dev/flutter/bin"
    "$HOME/.pub-cache/bin"
    "$HOME/dev/Android/Sdk/platform-tools"
  ];
  
  # Set environment variables
  home.sessionVariables = {
    ANDROID_HOME = "/home/nbs/dev/Android/Sdk";
  };

  # Enable font configuration
  fonts.fontconfig.enable = true;

  # Packages to install for the home environment
  home.packages = with pkgs; [
    corefonts
    nerd-fonts.fira-code

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
    stow
    eza #ls
    zoxide #cd

    clang
    cmake
    ninja

    bun
    gitui
    go
    hugo

    #gtk3 pkg-config | pkgconf-pkg-config gtk3-devel lzma-sdk-devel
    #kitty
    #neovim
    #nodePackages_latest.nodejs
  ];

  # Enable home-manager program
  programs.home-manager.enable = true;
  
  # Enable Java program support
  programs.java = {
    enable = true;
    package = pkgs.openjdk21;
  };
  
  # Git configuration
  programs.git = {
    enable = true;
    userName = "nofalbriansah";
    userEmail = "nofalbriansah@gmail.com";
  };

  # Enable Starship prompt
  programs.starship = {
    enable = true;

    settings = {
      username = {
        show_always = true;
        style_user = "bold green";
        style_root = "bold red";
      };

      hostname = {
        ssh_only = false;
        format = "[$hostname]($style) ";
        style = "bold blue";
      };
    };
  };

  # Bash Configuration
  programs.bash.enable = true;

  # Fish configuration
  programs.fish = {
    enable = true;
    interactiveShellInit = '' set fish_greeting # Disable greeting '';
    shellAbbrs = {
      # Application aliases
      ls = "eza";
      ll = "eza -l";
      rmt = "rmtrash";
      ff = "fastfetch";
      treed = "tree -L 5 -a";
      dot = "cd /home/nbs/dotfiles";

      # Dnf aliases
      du = "sudo dnf update && sudo dnf upgrade";
      dd = "sudo dnf autoremove";
      fu = "flatpak update";

      # Nix aliases
      nfmt = "nixpkgs-fmt /home/nbs/.config/home-manager/home.nix";
      hmd = "nix-collect-garbage -d";
      hms = "home-manager switch";
      hmg = "home manager generation";
      hmc = "nano /home/nbs/.config/home-manager/home.nix";
    };
  };

  # Kitty configuration
  programs.kitty = {
    enable = true;
    settings = {
      # Font
      font_family = "FiraCode Nerd Font";
      font_size = 13;

      # Scrolling dan Behavior
      enable_audio_bell = true;
      confirm_os_window_close = 0;

      # Cursor
      cursor_shape = "beam";
      cursor_blink_interval = 0;

      # Tab dan window management
      tab_bar_edge = "bottom";
      active_tab_font_style = "bold";

      # Set Fish as default shell in Kitty
      shell = "/home/nbs/.nix-profile/bin/fish"; 
    };
  };

  # Fastfetch configuration
  programs.fastfetch = {
    enable = true;
    settings = {
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

