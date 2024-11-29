local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- config.font = wezterm.font 'JetBrainsMono NL Nerd Font Mono'
-- config.font = wezterm.font 'monospace'

config.font_size = 10

config.color_scheme = 'Ayu Dark (Gogh)'

config.use_fancy_tab_bar = false

config.tab_max_width = 40

config.hide_tab_bar_if_only_one_tab = true

config.use_resize_increments = false

config.window_padding = {
	left = 12,
	right = 12,
	top = 12,
	bottom = 12,
}

return config
