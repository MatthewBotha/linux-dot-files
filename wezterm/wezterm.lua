-- WezTerm Configuration
local wezterm = require 'wezterm'
local config = {}
local mux = wezterm.mux

-- color scheme
config.color_scheme = 'Catppuccin Mocha'

-- background image
config.background = {
    {
        source = {
            File = '/home/lemonsir/.config/wezterm/glass-key.png',
        },
        hsb = { brightness = 0.1 },

        -- position and scale image correctly
        vertical_align = "Middle",
        horizontal_align = "Center",
        height = "Cover",
        width = "Cover",
    }
}

-- fonts
config.font = wezterm.font 'DM Mono'
config.font_size = 11.0

-- title bar
config.window_decorations = "NONE"

-- tab bar
config.enable_tab_bar = false

-- padding
config.window_padding = {
    left    = "1cell",
    right   = "1cell",
    top     = "0.5cell",
    bottom  = 0,
}

-- maximize on startup
wezterm.on("gui-startup", function()
    local tab, pane, window = mux.spawn_window{}
    window:gui_window():maximize()
end)

return config
