{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # extensions
    gnomeExtensions.arcmenu
    gnomeExtensions.just-perfection
    gnomeExtensions.pop-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.vitals
    gnomeExtensions.blur-my-shell

    # apps
    gnome.dconf-editor
    gnome.gnome-tweaks
    gnome.pomodoro
    ocs-url
  ];
}
