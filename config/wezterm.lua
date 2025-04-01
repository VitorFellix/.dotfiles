local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config = {
	color_scheme = 'Kanagawa (Gogh)',

	font = wezterm.font('JetBrains Mono', { weight = 'Regular', italic = false }),

	use_fancy_tab_bar = false,
	tab_max_width = 40,
	hide_tab_bar_if_only_one_tab = true,

	line_height = 1.0,
	font_size = 12.0,

	use_resize_increments = true,
	window_padding = {
		left = 6,
		right = 6,
		top = 6,
		bottom = 6,
	}
}

return config
