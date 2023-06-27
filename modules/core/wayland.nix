{ pkgs, inputs, ... }:
{
  imports = [
    inputs.hyprland.nixosModules.default
  ];

  programs.hyprland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
