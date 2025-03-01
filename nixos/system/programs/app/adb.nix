{ pkgs, ... }:

{
  programs.adb.enable = true;
   users.users.nbs.extraGroups = ["adbusers"];
}
