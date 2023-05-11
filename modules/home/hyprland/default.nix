{ inputs, pkgs, ... }:
{
  imports = [
    ./variables.nix
    inputs.hyprland.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    swww
    ripgrep
    pavucontrol
    wl-clipboard
    sox
    copyq
    flameshot
    wayland
    rofi
    alacritty
    neovide
    brave
    go
    nodejs
    yarn
  ];

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.gnome.adwaita-icon-theme;
    size = 24;
    x11 = {
      enable = true;
      defaultCursor = "Adwaita";
    };
  };

  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi = true;
    };
    nvidiaPatches = false;
    systemdIntegration = true;
    extraConfig = ''
$mainMod = SUPER
$term = alacritty
$browser = env -u WAYLAND_DISPLAY brave
$browser-private = env -u WAYLAND_DISPLAY brave --incognito

$left   = h
$right  = l
$up     = k
$down   = j

$ws1 = 1
$ws2 = 2
$ws3 = 3
$ws4 = 4
$ws5 = 5
$ws6 = 6
$ws7 = 7
$ws8 = 8
$ws9 = 9
$ws10 = 10

$kp1 = KP_End
$kp2 = KP_Down
$kp3 = KP_Next
$kp4 = KP_Left
$kp5 = KP_Begin
$kp6 = KP_Right
$kp7 = KP_Home
$kp8 = KP_Up
$kp9 = KP_Prior
$kp0 = KP_Insert

$move-size = 80

workspace = $ws1, default:true
monitor = , preferred, auto, 1

input {
  kb_layout = us
  follow_mouse = yes
}

misc {
  disable_hyprland_logo = true
  disable_splash_rendering = true
  disable_autoreload = false # autoreload is unnecessary on nixos
}

general {
  gaps_in = 5
  gaps_out = 10
  border_size = 1
  col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
  col.inactive_border = rgba(595959aa)
  layout = dwindle
}

dwindle {
  pseudotile = yes
  preserve_split = yes
}

master {
  new_is_master = true
  special_scale_factor = 1
  no_gaps_when_only = false
}

decoration {
  rounding = 0
  blur = yes
  blur_size = 3
  blur_passes = 1
  blur_new_optimizations = on

  active_opacity = 0.9
  inactive_opacity = 0.85

  drop_shadow = yes
  shadow_range = 4
  shadow_render_power = 3
  col.shadow = rgba(1a1a1aee)
}

animations {
  enabled = true
  bezier = smoothIn, 0.25, 1, 0.5, 1
  bezier = overshot, 0, 0, 0, 0
  animation = windows, 1, 3, smoothIn, slide
  animation = windowsOut, 1, 3, smoothIn, slide
  animation = border, 1, 2, smoothIn
  animation = fade, 1, 4, smoothIn
  animation = fadeDim, 1, 4, smoothIn
  animation = workspaces, 1, 3, smoothIn, slide
}

# ----------------------------------------------------------------
# keybindings
bind = $mainMod, return, workspace, $ws2
bind = $mainMod, return, exec, $term
bind = $mainMod SHIFT, return, exec, $term
bind = $mainMod, b, exec, $browser
bind = $mainMod SHIFT, b, exec, $browser-private
bind = $mainMod SHIFT, q, killactive,
bind = $mainMod SHIFT, e, exit
bind = $mainMod, z, pin,
bind = $mainMod, f, fullscreen,
bind = $mainMod, v, togglesplit,
bind = $mainMod, space, togglefloating,
bind = $mainMod, c, centerwindow,
bind = $mainMod, m, movecursortocorner, 3
bind = $mainMod, n, movetoworkspace, special
bind = $mainMod SHIFT, n, togglespecialworkspace,
bind = $mainMod SHIFT, space, movetoworkspacesilent, e+0
bind = $mainMod, p, exec, pkill rofi || rofi -show drun -modi drun
bind = $mainMod ALT, v, exec, copyq show

# screenshot
bind = $mainMod, Print, exec, XDG_CURRENT_DESKTOP=sway flameshot gui

# media and volume controls
binde = , XF86AudioMute, exec, lightvol.sh -s -v 'sset Master toggle'
binde = , XF86AudioRaiseVolume, exec, lightvol.sh -s -v 'sset Master 5%+'
binde = , XF86AudioLowerVolume, exec, lightvol.sh -s -v 'sset Master 5%-'

binde = , XF86MonBrightnessUp, exec, lightvol.sh -s -l '-A 5'
binde = , XF86MonBrightnessDown, exec, lightvol.sh -s -l '-U 5'

# switch focus
bind = $mainMod, tab, workspace, previous
bind = $mainMod CTRL, left, workspace, e-1
bind = $mainMod CTRL, right, workspace, e+1
bind = $mainMod CTRL, $left, workspace, e-1
bind = $mainMod CTRL, $right, workspace, e+1

bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

bind = $mainMod, $left, movefocus, l
bind = $mainMod, $right, movefocus, r
bind = $mainMod, $up, movefocus, u
bind = $mainMod, $down, movefocus, d

# move window
bind = $mainMod SHIFT, left, movewindow, l
bind = $mainMod SHIFT, right, movewindow, r
bind = $mainMod SHIFT, up, movewindow, u
bind = $mainMod SHIFT, down, movewindow, d

bind = $mainMod SHIFT, $left, movewindow, l
bind = $mainMod SHIFT, $right, movewindow, r
bind = $mainMod SHIFT, $up, movewindow, u
bind = $mainMod SHIFT, $down, movewindow, d

# switch workspace
bind = $mainMod, 1, workspace, $ws1
bind = $mainMod, 2, workspace, $ws2
bind = $mainMod, 3, workspace, $ws3
bind = $mainMod, 4, workspace, $ws4
bind = $mainMod, 5, workspace, $ws5
bind = $mainMod, 6, workspace, $ws6
bind = $mainMod, 7, workspace, $ws7
bind = $mainMod, 8, workspace, $ws8
bind = $mainMod, 9, workspace, $ws9
bind = $mainMod, 0, workspace, $ws10

bind = $mainMod, $kp1, workspace, $ws1
bind = $mainMod, $kp2, workspace, $ws2
bind = $mainMod, $kp3, workspace, $ws3
bind = $mainMod, $kp4, workspace, $ws4
bind = $mainMod, $kp5, workspace, $ws5
bind = $mainMod, $kp6, workspace, $ws6
bind = $mainMod, $kp7, workspace, $ws7
bind = $mainMod, $kp8, workspace, $ws8
bind = $mainMod, $kp9, workspace, $ws9
bind = $mainMod, $kp0, workspace, $ws10

# same as above, but switch to the workspace
bind = $mainMod SHIFT, 1, movetoworkspacesilent, $ws1
bind = $mainMod SHIFT, 2, movetoworkspacesilent, $ws2
bind = $mainMod SHIFT, 3, movetoworkspacesilent, $ws3
bind = $mainMod SHIFT, 4, movetoworkspacesilent, $ws4
bind = $mainMod SHIFT, 5, movetoworkspacesilent, $ws5
bind = $mainMod SHIFT, 6, movetoworkspacesilent, $ws6
bind = $mainMod SHIFT, 7, movetoworkspacesilent, $ws7
bind = $mainMod SHIFT, 8, movetoworkspacesilent, $ws8
bind = $mainMod SHIFT, 9, movetoworkspacesilent, $ws9
bind = $mainMod SHIFT, 0, movetoworkspacesilent, $ws10

bind = $mainMod SHIFT, $kp1, movetoworkspacesilent, $ws1
bind = $mainMod SHIFT, $kp2, movetoworkspacesilent, $ws2
bind = $mainMod SHIFT, $kp3, movetoworkspacesilent, $ws3
bind = $mainMod SHIFT, $kp4, movetoworkspacesilent, $ws4
bind = $mainMod SHIFT, $kp5, movetoworkspacesilent, $ws5
bind = $mainMod SHIFT, $kp6, movetoworkspacesilent, $ws6
bind = $mainMod SHIFT, $kp7, movetoworkspacesilent, $ws7
bind = $mainMod SHIFT, $kp8, movetoworkspacesilent, $ws8
bind = $mainMod SHIFT, $kp9, movetoworkspacesilent, $ws9
bind = $mainMod SHIFT, $kp0, movetoworkspacesilent, $ws10

# window control
binde = $mainMod CTRL SHIFT, left, resizeactive, -$move-size 0
binde = $mainMod CTRL SHIFT, right, resizeactive, $move-size 0
binde = $mainMod CTRL SHIFT, up, resizeactive, 0 -$move-size
binde = $mainMod CTRL SHIFT, down, resizeactive, 0 $move-size

binde = $mainMod CTRL SHIFT, $left, resizeactive, -$move-size 0
binde = $mainMod CTRL SHIFT, $right, resizeactive, $move-size 0
binde = $mainMod CTRL SHIFT, $up, resizeactive, 0 -$move-size
binde = $mainMod CTRL SHIFT, $down, resizeactive, 0 $move-size

binde = $mainMod ALT, left, moveactive,  -$move-size 0
binde = $mainMod ALT, right, moveactive, $move-size 0
binde = $mainMod ALT, up, moveactive, 0 -$move-size
binde = $mainMod ALT, down, moveactive, 0 $move-size

binde = $mainMod ALT, $left, moveactive,  -$move-size 0
binde = $mainMod ALT, $right, moveactive, $move-size 0
binde = $mainMod ALT, $up, moveactive, 0 -$move-size
binde = $mainMod ALT, $down, moveactive, 0 $move-size

# mouse binding
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# windowrule
windowrule = tile, neovide

windowrule = float, pavucontrol
windowrule = center, pavucontrol

windowrule = float, copyq
windowrule = center, copyq

windowrule = float, title:^(Firefox — Sharing Indicator)$
windowrule = center, title:^(Firefox — Sharing Indicator)$

$pic-in-pic = title:^(Picture-in-Picture|Picture in picture)$
windowrule = float, $pic-in-pic
windowrule = opacity 1.0 override 1.0 override, $pic-in-pic
windowrule = pin, $pic-in-pic

# autostart
exec-once = swww init
exec-once = waybar
exec-once = wall.sh
exec-once = fcitx5 -dr
exec-once = sleep 5 && copyq --start-server
exec-once = sleep 5 && XDG_CURRENT_DESKTOP=sway flameshot
    '';
  };
}

