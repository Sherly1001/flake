{
  description = "Sherly1001's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    stateVersion = "22.11";
    selfPkgs = import ./pkgs;
  in {
    nixosConfigurations = import ./modules/core {
      inherit self nixpkgs inputs stateVersion selfPkgs;
    };
  };
}
