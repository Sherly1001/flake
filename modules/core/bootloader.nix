{ ... }:
{
  boot = {
    tmp.cleanOnBoot = true;
    loader = {
      timeout = 3;
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 10;
      efi.canTouchEfiVariables = true;
    };
  };
}
