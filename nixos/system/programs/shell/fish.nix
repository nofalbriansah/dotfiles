{ config, pkgs, ... }:

{
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';
      shellAbbrs = {
        #app
        cat = "bat";
        htop = "btop";
        ls = "eza";
        ll = "eza -l";
        rm = "rmtrash";
        text = "gnome-text-editor";

        #dev
        dev = "cd /mnt/sda1/system/coding";
        ndf = "nix develop .#flutter";

        #nix
        ncg = "sudo nix-collect-garbage";
        nsw = "sudo nixos-rebuild switch";
        nswb = "sudo nixos-rebuild boot";
        ncon = "cd /etc/nixos";
        ngen = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
        ndel = "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations 999";
        ngc = "sudo nix-store --gc";
      };
    };
    starship = {
      enable = true;
      presets = [
        "nerd-font-symbols"
      ];
    };
    thefuck = { enable = true; };
  };
}

