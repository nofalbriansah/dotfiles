{ config, pkgs, ... }:

{
  # kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # boot
  boot.loader = {
    efi.canTouchEfiVariables = true; #disable if use grub
    
    #grub
    grub = {
      enable = false;
      efiSupport = true;
      device = "nodev";
      theme = pkgs.nixos-grub2-theme;
      efiInstallAsRemovable = true;
    }; 
  
    #systemd
    systemd-boot.enable = true;
  };
}
