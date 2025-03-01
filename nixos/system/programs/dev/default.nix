{ config, ... }:

{
  imports = [
    ./bin.nix
    ./git.nix
    ./flutter.nix
  ];
}
