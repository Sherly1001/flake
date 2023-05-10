{ self, pkgs, inputs, stateVersion, ... }:
{
  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.inputMethod.enabled = "ibus";
  i18n.inputMethod.ibus.engines = with pkgs.ibus-engines; [ bamboo ];

  system.stateVersion = stateVersion;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  environment.localBinInPath = true;

  environment.systemPackages = with pkgs; [
    wget
    curl
    git
  ];

  environment.variables = rec {
    EDITOR = "nvim";
    GTK_IM_MODULE = "ibus";
    QT_IM_MODULE = "ibus";
    XMODIFIERS = "@im=ibus";
    SDL_IM_MODULE = "ibus";
    GLFW_IM_MODULE = "ibus";
  };
}
