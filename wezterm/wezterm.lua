--
-- wezterm config
--
-- https://wezfurlong.org/wezterm/
-- https://github.com/wez/wezterm
--
local wezterm = require 'wezterm';
return {
  --font, color and opacity
  font = wezterm.font("JetBrainsMono NF"),
  font_size = 10.5,
  window_background_opacity = 0.82,
  color_scheme = "nord",
  --
  warn_about_missing_glyphs = false,
  --tab
  hide_tab_bar_if_only_one_tab = true,
  -- padding
  window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0,
  },
  -- check updates
  check_for_updates = true,
  check_for_updates_interval_seconds = 86400,
}

