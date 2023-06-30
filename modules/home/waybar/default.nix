{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    style = ''
      @define-color red             #E06C75;
      @define-color dark_red        #BE5046;
      @define-color green           #98C379;
      @define-color yellow          #E5C07B;
      @define-color dark_yellow     #D19A66;
      @define-color blue            #61AFEF;
      @define-color purple          #C678DD;
      @define-color cyan            #56B6C2;
      @define-color white           #ABB2BF;
      @define-color grey            #5C6370;
      @define-color light           #c6cdda;
      @define-color black           #282C34;
      @define-color foreground      #ABB2BF;
      @define-color background      rgba(43, 48, 59, 0.85);
      @define-color trans           rgba(0, 0, 0, 0);

      * {
        font-family: Consolas, "Font Awesome 6 Free", "Font Awesome 6 Brands", "Iosevka Nerd Font";
        font-size: 18px;
      }

      window#waybar {
        background-color: @background;
        color: @white;
        border-radius: 8px;
      }

      button {
        box-shadow: none;
        border: none;
        border-radius: 0;
      }

      #workspaces {
        padding-left: 5px;
      }

      #workspaces button {
        color: @white;
      }

      #workspaces button:hover {
        text-shadow: none;
        background: unset;
      }

      #workspaces button.active {
        color: @light;
        border-bottom: 2px solid @light;
      }

      #workspaces button.urgent {
        background-color: #eb4d4b;
      }

      #window {
        padding: 0 50px;
      }

      #tray {
        padding-right: 10px;
      }

      #custom-sher-noob {
        border-bottom: 2px solid #be5046;
      }
    '';
    settings = [{
      "layer" = "top";
      "height" = 34;
      "spacing" = 10;
      "margin" = "8 10 0";
      "modules-left" = [
        "wlr/workspaces"
        "custom/sher-noob"
      ];
      "modules-center" = [
        "hyprland/window"
      ];
      "modules-right" = [
        "cpu"
        "backlight"
        "pulseaudio"
        "clock"
        "tray"
      ];
      "hyprland/window" = {
        "separate-outputs" = true;
      };
      "wlr/workspaces" = {
        "on-click" = "activate";
        "on-scroll-up" = "hyprctl dispatch workspace e+1";
        "on-scroll-down" = "hyprctl dispatch workspace e-1";
        "format" = "{icon}";
        "format-icons" = {
          "1" = "1 ";
          "2" = "2 ";
          "3" = "3 ";
          "4" = "4 ";
          "5" = "5 ";
          "6" = "6 ";
          "7" = "7 ";
          "8" = "8 ";
          "9" = "9 ";
          "10" = "10 ";
        };
        "sort-by-name" = false;
        "sort-by-number" = true;
      };
      "cpu" = {
        "interval" = 5;
        "format" = " {usage}%";
      };
      "backlight" = {
        "format" = "{icon} {percent}%";
        "format-icons" = [ "🌑" "🌒" "🌓" "🌔" "🌕" ];
        "on-click" = "light -S 20";
        "on-scroll-up" = "lightvol.sh -s -l '-A 5'";
        "on-scroll-down" = "lightvol.sh -s -l '-U 5'";
      };
      "pulseaudio" = {
        "format" = "{icon} {volume}%";
        "format-muted" = " {volume}%";
        "format-icons" = {
          "headphone" = [ "" "" ];
          "default" = [ "" "" "" ];
        };
        "on-click-right" = "pavucontrol";
        "on-click" = "lightvol.sh -s -v 'sset Master toggle'";
        "on-scroll-up" = "lightvol.sh -s -v 'sset Master 5%+'";
        "on-scroll-down" = "lightvol.sh -s -v 'sset Master 5%-'";
      };
      "clock" = {
        "interval" = 1;
        "format" = "{:%a %b %d, %R}";
        "timezone" = "Asia/Ho_Chi_Minh";
        "tooltip" = true;
        "tooltip-format" = "<tt>{calendar}</tt>";
      };
      "custom/sher-noob" = {
        "format" = "| Sher-Noob |";
      };
      "tray" = {
        "spacing" = 10;
      };
    }];
  };
  programs.waybar.package = pkgs.waybar.overrideAttrs (oa: {
    mesonFlags = (oa.mesonFlags or  [ ]) ++ [ "-Dexperimental=true" ];
    patches = (oa.patches or [ ]) ++ [
      (pkgs.fetchpatch {
        name = "fix waybar hyprctl";
        url = "https://aur.archlinux.org/cgit/aur.git/plain/hyprctl.patch?h=waybar-hyprland-git";
        sha256 = "sha256-pY3+9Dhi61Jo2cPnBdmn3NUTSA8bAbtgsk2ooj4y7aQ=";
      })
    ];
  });
}
