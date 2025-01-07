{ config, pkgs, ... }:
{
  fonts.packages = with pkgs; [
    font-awesome
    corefonts
    fira-code
    fira-code-symbols
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}





