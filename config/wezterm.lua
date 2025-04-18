local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config = {
	color_scheme = 'One Dark (Gogh)',

	font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Regular', italic = false }),

	use_fancy_tab_bar = false,
	tab_max_width = 40,
	hide_tab_bar_if_only_one_tab = true,

	line_height = 1.0,
	font_size = 10.0,

	use_resize_increments = true,
	window_padding = {
		left = 24,
		right = 24,
		top = 24,
		bottom = 24,
	}
}

return config
