{ pkgs, ... }:
{
  home.packages = with pkgs; [
    joypixels
    vistafonts
    noto-fonts
    noto-fonts-cjk-sans
  ];
  xdg.dataFile."fonts".source = ./fc;
}
