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

-- Workspace
config.default_workspace = "main"

config.status_update_interval = 1000

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
    local basename = function(s)
        -- Nothing a little regex can't fix
        return string.gsub(s, "(.*[/\\])(.*)", "%2")
    end
    local stat = window:active_workspace()

    -- Current working directory
    local cwd = pane:get_current_working_dir()
    if cwd then
        cwd = basename(cwd.file_path)
    else
        cwd = ""
    end

    -- Current command
    local cmd = pane:get_foreground_process_name()
    cmd = cmd and basename(cmd) or ""

    -- Left status (left of the tab line)
    window:set_left_status(wezterm.format({
        -- { Foreground = { Color = stat_color } },
        { Text = "  " },
        { Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
        { Text = " |" },
    }))

    -- Right status
    window:set_right_status(wezterm.format({
        -- Wezterm has a built-in nerd fonts
        -- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
        { Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
        { Text = " | " },
        -- { Foreground = { Color = custom_colors.yellow } },
        { Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
        { Text = "  " },
    }))

end)

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {

    -- Workspace (similar to session in Tmux)
    { key = "s", mods = "LEADER",      action = wezterm.action.ShowLauncherArgs { flags = "FUZZY|WORKSPACES" } },
}

-- HA settings
config.max_fps = 60
config.prefer_egl = false

-- done
return config
