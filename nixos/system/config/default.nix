{ config, ... }:

{
  imports = [
    ./bootloader.nix
    ./env.nix
    ./fonts.nix
    ./gnome.nix
    ./internationalisation.nix
    ./nix-config.nix
    ./network.nix
    ./nvidia.nix
    ./user.nix
    ./sound.nix
    ./xserver.nix
  ];
}


