{ ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "none";
        width = 350;
        height = 300;
        origin = "top-right";
        offset = "10x30";
        scale = 0;
        notification_limit = 0;
        progress_bar = true;
        progress_bar_height = 2;
        progress_bar_frame_width = 0;
        progress_bar_min_width = 150;
        progress_bar_max_width = 350;
        indicate_hidden = "yes";
        transparency = 15;
        separator_height = 5;
        padding = 10;
        horizontal_padding = 10;
        text_icon_padding = 0;
        frame_width = 0;
        frame_color = "#aaaaaa";
        separator_color = "#0000";
        sort = "yes";
        idle_threshold = 120;
        font = "Noto Sans 12";
        line_height = 0;
        markup = "full";
        format = "<b>%s</b>\n%b";
        alignment = "left";
        vertical_alignment = "top";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = "no";
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = "yes";
        icon_position = "left";
        min_icon_size = 0;
        max_icon_size = 48;
        sticky_history = "yes";
        history_length = 100;
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 6;
        ignore_dbusclose = false;
        force_xwayland = false;
        force_xinerama = false;
        mouse_left_click = "do_action, close_current";
        mouse_middle_click = "close_all";
        mouse_right_click = "close_current";
      };
      experimental = {
        per_monitor_dpi = false;
      };
      urgency_low = {
        background = "#222222";
        foreground = "#888888";
        timeout = 5;
      };
      urgency_normal = {
        background = "#222222";
        foreground = "#ffffff";
        timeout = 5;
      };
      urgency_critical = {
        background = "#900000";
        foreground = "#ffffff";
        frame_color = "#ff0000";
        timeout = 0;
      };
      fullscreen_delay_everything = {
        fullscreen = "delay";
      };
    };
  };
}
