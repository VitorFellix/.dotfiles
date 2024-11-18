local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- config.window_frame = {
-- 	font = wezterm.font { family = 'JetBrains Mono', weight = 'Bold' }
-- }

config.font = wezterm.font 'JetBrainsMono NL Nerd Font Mono'

-- config.color_scheme = 'nightfox'

config.use_fancy_tab_bar = false

config.tab_max_width = 12

config.use_resize_increments = true

config.window_padding = {
	left = 12,
	right = 12,
	top = 12,
	bottom = 12,
}

-- config.background = {
-- 	{
-- 		source = { Color = "Black" },
-- 		height = '100%',
-- 		width = '100%',
-- 	}, {
-- 		source = { File = '/home/vitor/pictures/wallpapers/terminal.jpg', },
-- 		vertical_align = 'Middle',
-- 		horizontal_align = 'Center',
-- 		height = 'Contain',
-- 		width = 'Contain',
-- 		hsb = { brightness = 0.1 },
-- 		repeat_x = 'NoRepeat',
-- 		repeat_y = 'NoRepeat',
-- 		opacity = 1,
-- 	},
-- }

return config
