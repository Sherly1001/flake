{ inputs, nixpkgs, self, stateVersion, selfPkgs, ... }:

let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    overlays = [ selfPkgs.overlay ];
    config.allowUnfree = true;
    config.joypixels.acceptLicense = true;
  };
in
{
  nixos = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs pkgs stateVersion; };
    modules = [
      ./bootloader.nix
      ./hardware.nix
      ./pipewire.nix
      ./network.nix
      ./system.nix
      ./wayland.nix
      ./user.nix
      ./program.nix
      ../../hosts/hardware-configuration.nix
    ];
  };
}
