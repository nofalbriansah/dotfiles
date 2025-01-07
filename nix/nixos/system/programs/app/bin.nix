{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      wget
      curl
      nixpkgs-fmt
      appimage-run
      rmtrash
      zip
      unzip
      unrar
    ];
  };

  users.users.nbs = {
    packages = with pkgs; [
      btop
      nano
      tree
      neofetch
      speedtest-cli
      zoxide
      bat
      eza
      #kitty
      #neovim
      #helix

      alacarte
      firefox
      google-chrome
      vlc
      zoom-us
      telegram-desktop
      persepolis
      wpsoffice
      onlyoffice-bin_latest
      zotero_7
      mendeley
    ];
  };
}
