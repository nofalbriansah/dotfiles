{ config, pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;
      ohMyZsh = {
        enable = true;
        plugins = [ "git" "sudo" "thefuck" ];
        theme = "agnoster"; #"amuse";
      };
      shellAliases = {
        #app
        cat = "bat";
        htop = "btop";
        ls = "eza";
        ll = "eza -l";
        rm = "rmtrash";
        text = "gnome-text-editor";

        #dev
        dev = "cd /mnt/sda1/system/coding";

        #nix
        nclean = "sudo nix-collect-garbage -d";
        nsw = "sudo nixos-rebuild switch --flake .";
        nsb = "sudo nixos-rebuild boot --flake .";
        ncon = "cd /etc/nixos";
      };
    };
    thefuck = { enable = true; };
    starship = {
      enable = true;
      presets = [
        "nerd-font-symbols"
      ];
    };
  };
}
