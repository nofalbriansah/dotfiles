{ pkgs, ... }: {
  users = {
    defaultUserShell = pkgs.fish;

    users.nbs = {
      isNormalUser = true;
      description = "nbs";
      extraGroups = [
        "networkmanager"
        "wheel"
        "input"
        "libvirtd"
        #"adbusers"
      ];
      packages = with pkgs; [ ];
    };
  };
}
