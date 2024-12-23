local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config = {
	-- color_scheme = 'Andromeda',

	use_fancy_tab_bar = false,
	tab_max_width = 40,
	hide_tab_bar_if_only_one_tab = true,

	line_height = 1.0,
	font_size = 12.0,

	use_resize_increments = false,
	window_padding = {
		left = 4,
		right = 4,
		top = 4,
		bottom = 4,
	}
}

return config
