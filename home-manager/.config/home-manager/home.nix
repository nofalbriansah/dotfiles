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
    "$HOME/.nix-profile/bin"
    "$HOME/.local/bin"
    "$HOME/bin"
    "$HOME/.pub-cache/bin"
    "$HOME/dev/Android/Sdk/platform-tools"
    "$HOME/dev/Android/Sdk/ndk-build"
    "$HOME/dev/flutter/bin"
  ];

  # Environment Variables
  home.sessionVariables = {
    JAVA_HOME = "${pkgs.openjdk21}/lib/openjdk";
    ANDROID_HOME = "/home/nbs/dev/Android/Sdk";
    FLUTTER_HOME = "/home/nbs/dev/flutter/bin";
    NODE_PATH = "${pkgs.nodePackages_latest.nodejs}/lib/node_modules";
    CHROME_EXECUTABLE = "/usr/bin/google-chrome-stable";
    # GOROOT = "${pkgs.go}/lib/go";
  };

  # Enable font configuration
  fonts.fontconfig.enable = true;

  # Home Packages
  home.packages = with pkgs; [
    corefonts
    inter
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono

    wget
    curl
    rmtrash
    nixpkgs-fmt
    zip
    unzip
    unrar
    btop
    nano
    tree
    stow
    bat #cat
    eza #ls
    zoxide #cd

    clang
    cmake
    ninja
    firebase-tools
    android-tools
    scrcpy
    nodePackages_latest.nodejs
    bun
    gitui
    go
    hugo

    #libgtk-3-dev
  ];

  # Enable Home Manager
  programs.home-manager.enable = true;

  # Enable Java
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

  # Neovim
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
    ];
  };

  # Enable Starship prompt
  programs.starship = {
    enable = true;
    settings = {
      # git_status.command_timeout = 2000; # (default 500)
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
  programs.bash.enable = false;

  # Fish configuration
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # Disable Fish greeting
      set -g fish_greeting
    '';
    shellAbbrs = {
      # Application aliases
      ls = "eza";
      ll = "eza -l";
      rmt = "rmtrash";
      ff = "fastfetch";
      treed = "tree -L 5 -a";
      dot = "cd /home/nbs/dev/dotfiles";
      dev = "cd /mnt/Data/development/coding";

      # Pacman aliases
      pu = "sudo pacman -Syu";
      pd = "sudo pacman -Rs $(pacman -Qdtq)";
      fu = "flatpak update";

      # Nix aliases
      hmf = "nixpkgs-fmt /home/nbs/.config/home-manager/home.nix";
      hmu = "nix-channel --update";
      hmd = "nix-collect-garbage -d";
      hms = "home-manager switch";
      hmg = "home manager generation";
      hmc = "nano /home/nbs/.config/home-manager/home.nix";
    };
  };

  # Kitty Terminal Configuration
  programs.kitty = {
    enable = false;
    settings = {
      # Font
      font_family = "FiraCode Nerd Font";
      font_size = 12;

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

  # Ghostty Terminal Configuration
  programs.ghostty = {
    enable = false;
    # shellIntegration.enableFishIntegration = true;
    settings = {
      font-size = 12;
      font-family = "FiraCode Nerd Font";
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
