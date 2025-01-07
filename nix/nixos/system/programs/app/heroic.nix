# configuration.nix

{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    heroic
    wine
    winetricks
  ];

  environment.sessionVariables = {
    #STEAM_EXTRA_COMPAT_TOOLS_PATHS =
    #  "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
