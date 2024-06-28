-- WezTerm Configuration
local wezterm = require 'wezterm'
local config = {}
local act = wezterm.action
local mux = wezterm.mux

-- color scheme
-- config.color_scheme = 'Catppuccin Mocha'
-- rose-pine start
-- local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').main
local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').moon
-- local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').dawn
config.colors = theme.colors()
-- rose-pine end

-- background image
local background_dir = '/home/lemonsir/.config/backgrounds'
config.background = {
    {
        source = {
            -- File = background_dir .. '/ghost-in-the-shell.jpg',
            -- File = background_dir .. '/glass-key.png',
            -- File = background_dir .. '/spirited-away.jpg',
            File = background_dir .. '/spirited-away-railway.jpg',
        },
        hsb = { brightness = 0.1 },

        -- position and scale image correctly
        vertical_align = 'Middle',
        horizontal_align = 'Center',
        height = 'Cover',
        width = 'Cover',
    }
}

-- inactive panes
config.inactive_pane_hsb = {
    saturation = 0.7,
    brightness = 0.4,
}

-- fonts
config.font = wezterm.font 'DM Mono'
config.font_size = 11.0
config.warn_about_missing_glyphs = false

-- char_select options
config.char_select_font_size = 11.0
config.char_select_bg_color = "#1f1d2e"
config.char_select_fg_color = "#e0def4"

-- title bar
config.window_decorations = 'NONE'

-- tab bar
-- config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- padding
config.window_padding = {
    left    = '0.5cell',
    right   = '0.5cell',
    top     = '0.5cell',
    bottom  = 0,
}

-- maximize on startup
wezterm.on('gui-startup', function()
    local tab, pane, window = mux.spawn_window{}
    window:gui_window():maximize()
end)

-- keybindings
config.leader = { key = '\\', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
    -- split
    {
        mods = 'LEADER',
        key = '-',
        action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        mods = 'LEADER',
        key = '\\',
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },

    -- maximize pane
    {
        mods = 'LEADER',
        key = 'z',
        action = act.TogglePaneZoomState,
    },

    -- resize active pane
    {
        key = 'UpArrow',
        mods = 'SHIFT|ALT',
        action = act.AdjustPaneSize { 'Up', 5 },
    },
    {
        key = 'DownArrow',
        mods = 'SHIFT|ALT',
        action = act.AdjustPaneSize { 'Down', 5 },
    },
    {
        key = 'LeftArrow',
        mods = 'SHIFT|ALT',
        action = act.AdjustPaneSize { 'Left', 5 },
    },
    {
        key = 'RightArrow',
        mods = 'SHIFT|ALT',
        action = act.AdjustPaneSize { 'Right', 5 },
    },

    -- new tab
    {
        key = 'c',
        mods = 'LEADER',
        action = act.SpawnTab 'CurrentPaneDomain',
    },
    {
        key = 'd',
        mods = 'LEADER',
        action = act.SpawnCommandInNewTab { cwd = wezterm.home_dir },
    },

    -- rename tab
    {
        key = ',',
        mods = 'LEADER',
        action = act.PromptInputLine {
            description = 'Enter new name for tab',
            action = wezterm.action_callback(function(window, pane, line)
                -- line will be `nil` if they hit escape without entering anything
                -- An empty string if they just hit enter
                -- Or the actual line of text they wrote
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        },
    },

    -- unicode selector
    {
        key = '.',
        mods = 'CTRL',
        action = act.CharSelect {
            copy_on_select = true,
            copy_to = 'ClipboardAndPrimarySelection',
        },
    },
}

-- switch tab
for i = 1, 8 do
    table.insert(config.keys, {
        key = 'F' .. tostring(i),
        action = act.ActivateTab(i - 1),
    })
end

return config
