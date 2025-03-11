-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Color scheme
config.color_scheme = 'Gruvbox dark, hard (base16)'

-- Font
config.font = wezterm.font('CaskaydiaMono Nerd Font', { stretch = 'Normal', weight = 'Regular' })
config.font_size = 16

-- Tab bar
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- Window settings and decorations
config.window_decorations = "RESIZE|MACOS_FORCE_SQUARE_CORNERS"
config.window_background_opacity = .9
config.macos_window_background_blur = 90

config.window_padding = {
    left = 1,
    right = 1,
    top = 1,
    bottom = 1,
}

-- Overrides based on window focus
wezterm.on('update-status', function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if window:is_focused() then
        overrides.window_frame = {
            border_left_width = '4px',
            border_right_width = '4px',
            border_bottom_height = '4px',
            border_top_height = '4px',
            border_left_color = 'green',
            border_right_color = 'green',
            border_bottom_color = 'green',
            border_top_color = 'green',

        }
    else
        overrides.window_frame = {
            border_left_width = '4px',
            border_right_width = '4px',
            border_bottom_height = '4px',
            border_top_height = '4px',
            border_left_color = 'grey',
            border_right_color = 'grey',
            border_bottom_color = 'grey',
            border_top_color = 'grey',

        }
    end
    window:set_config_overrides(overrides)
end)

-- HA settings
config.max_fps = 60
config.prefer_egl = false

-- done
return config
