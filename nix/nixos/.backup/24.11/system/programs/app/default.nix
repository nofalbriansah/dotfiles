{ config, ... }:

{
  imports = [
    #./adb.nix
    ./bin.nix
    ./heroic.nix  
    ./virt-manager.nix
  ];
}
