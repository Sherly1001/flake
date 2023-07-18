{ ... }:
{
  programs = {
    nix-ld.enable = true;
    fish.enable = true;
    neovim.enable = true;
    light.enable = true;
    git = {
      enable = true;
      config = {
        init = {
          defaultBranch = "main";
        };
        push = {
          autoSetupRemote = true;
        };
      };
    };
  };
}
