{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable Desktop Environment.
  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Configure keymap in X11
  services.xserver = {
    xkb = {
      variant = "";
      layout = "us";
    };
  };
}
