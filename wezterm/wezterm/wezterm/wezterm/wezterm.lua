--
-- wezterm config
--
-- https://wezfurlong.org/wezterm/
-- https://github.com/wez/wezterm
--
local wezterm = require("wezterm")
return {
	-- term definition
	term = "wezterm",
	-- font and size
	font = wezterm.font("Fira Code Nerd Font"),
	-- font = wezterm.font("Hasklug Nerd Font Mono"),
	font_size = 10.50,
	-- opacity and color theme
	window_background_opacity = 0.80,
	color_scheme = "nord",
	-- cursor
	default_cursor_style = "SteadyBar",
	-- tab
	hide_tab_bar_if_only_one_tab = true,
	-- padding
	window_padding = {
		left = 6,
		right = 3,
		top = 1,
		bottom = 1,
	},
	-- keybinds
	keys = {
		-- SplitHorizontal
		{
			key = "v",
			mods = "CTRL|ALT",
			action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},
		-- SplitVertical
		{
			key = "h",
			mods = "CTRL|ALT",
			action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
		},
		-- CloseCurrentPane
		{
			key = "q",
			mods = "ALT",
			action = wezterm.action({ CloseCurrentPane = { confirm = true } }),
		},
	},
	-- disable warnings
	warn_about_missing_glyphs = false,
	-- check updates
	check_for_updates = true,
	check_for_updates_interval_seconds = 86400,
}
