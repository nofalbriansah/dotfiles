{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, android-nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { 
        inherit system;
        config = {
          allowUnfree = true;
          android_sdk.accept_license = true; 
        }; 
      };
      androidSdk = (import android-nixpkgs { inherit pkgs; }).sdk (sdkPkgs: with sdkPkgs; [
        cmdline-tools-latest
        build-tools-34-0-0
        platform-tools
        platforms-android-34
        emulator
      ]);
    in

    {
      # format nix code
      formatter.system = pkgs.nixpkgs-fmt;

      # Provide android-sdk to NixOS configuration
      packages.system.android-sdk = androidSdk;

      # nixos - system hostname
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs system pkgs androidSdk;
        };
        modules = [
          ./configuration.nix
        ];
      };
   };
}
