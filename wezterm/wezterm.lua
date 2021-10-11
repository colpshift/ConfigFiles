--
-- wezterm config
--
-- https://wezfurlong.org/wezterm/
-- https://github.com/wez/wezterm
--
local wezterm = require 'wezterm';
return {
  --font, color and opacity
  font_size = 10.5,
  window_background_opacity = 0.80,
  color_scheme = "nord",
  --
  warn_about_missing_glyphs = false,
  --tab
  hide_tab_bar_if_only_one_tab = true,
  -- padding
  window_padding = {
    left = 3,
    right = 4,
    top = 1,
    bottom = 1,
  },
  -- check updates
  check_for_updates = true,
  check_for_updates_interval_seconds = 86400,
}

