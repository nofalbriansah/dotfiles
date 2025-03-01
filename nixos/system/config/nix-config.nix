{
  # activate flake
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # unfree software
  nixpkgs.config.allowUnfree = true;
}
