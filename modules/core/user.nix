{ pkgs, inputs, stateVersion, ... }:

let
  name = "Sherly1001";
  username = "sher";
  email = "Sherly1001@users.noreply.github.com";
  packages = with pkgs; [
    fish
    neovim
  ];
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users.${username} = {
      imports = [ ../home ];
      home.username = username;
      home.homeDirectory = "/home/${username}";
      home.stateVersion = stateVersion;
      programs.home-manager.enable = true;
      programs.git.enable = true;
      programs.git.userName = name;
      programs.git.userEmail = email;

    };
  };

  users.groups.video = { };
  users.groups.users.gid = pkgs.lib.mkForce 1000;

  users.users.${username} = {
    shell = pkgs.fish;
    description = name;
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ];
    hashedPassword = "$6$bsY5cnUgJ8ry7k4G$2MQmWWeHzIE14.1UH/4PHeERgKv9BThVejr8AdR/Iv5XQaGX5lKAmvSyNpJmt5IltRmI6SUrKbVtkLsRNRlA50";
  };
}
