{ pkgs, ... }:
{
  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.gnome.adwaita-icon-theme;
    size = 24;
    x11 = {
      enable = true;
      defaultCursor = "Adwaita";
    };
  };

  gtk = {
    enable = true;
    font.name = "Noto Sans";
    theme = {
      name = "Arc-Dark";
      package = pkgs.arc-theme;
    };
    iconTheme = {
      name = "Adawaita";
      package = pkgs.arc-icon-theme;
    };
  };
}
