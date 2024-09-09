-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Gruvbox dark, medium (base16)'
config.color_scheme = 'Gruvbox Dark (Gogh)'

-- Font
config.font = wezterm.font('CaskaydiaMono Nerd Font', { stretch = 'Normal', weight = 'Regular' })
config.font_size = 14.5

-- Window decoration and tabs
-- config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- and finally, return the configuration to wezterm
return config
