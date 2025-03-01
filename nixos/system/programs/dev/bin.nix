{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodePackages_latest.nodejs
    hugo

    vscode
    genymotion
    google-chrome
    godot_4
  ];
}
