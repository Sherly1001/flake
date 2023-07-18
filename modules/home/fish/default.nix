{ pkgs, ... }:
{
  home.file.".funcs.fish".source = ./.funcs.fish;
  programs.fish = {
    enable = true;
    loginShellInit = ''
      set TTY1 (tty)
      [ "$TTY1" = "/dev/tty1" ] && exec Hyprland >/tmp/hypr.logs 2>/tmp/hypr.errs
    '';
    shellInit = ''
      set -x PATH ~/.yarn/bin $PATH
      set -x NIX_LD (cat "${pkgs.stdenv.cc}/nix-support/dynamic-linker")

      if [ -f ~/.funcs.fish ]
        source ~/.funcs.fish
      end

      if [ -f ~/.customs.fish ]
        source ~/.customs.fish
      end
    '';
    shellAliases = {
      vi = "nvim";
      nu = "nix-env --uninstall";
      nv = "env -u WAYLAND_DISPLAY neovide --multigrid";
      xw = "env -u WAYLAND_DISPLAY";

      dp = "docker-compose";
      cm = "cmake -B build -S .";
      cmb = "cmake --build build";

      gco = "git checkout";
      gcoo = "gco master";
      gcm = "git commit -m";
      gcma = "git commit --amend";
      gad = "git add";
      glg = "git log";
      glo = "git log --oneline";
      gla = "git log --oneline --graph --all";
      gpu = "git push";
      gpl = "git pull";
      gft = "git fetch";
      gcl = "git clone";
      gmg = "git merge";
      gbr = "git branch";
      gst = "git status";
      gdf = "git diff";
      gdc = "git diff --cached";
      gd = "git diff --no-index";

      # nixos
      ncg = "nix-collect-garbage && nix-collect-garbage -d && sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/*";
      nrf = "sudo nixos-rebuild switch --flake ~/flake/.#nixos";
    };
  };
}
