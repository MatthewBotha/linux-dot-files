-- WezTerm Configuration
local wezterm = require 'wezterm'
local config = {}

-- color scheme
-- config.color_scheme = 'Catppuccin Mocha'

-- background image
config.window_background_image = '/home/lemonsir/.config/wezterm/glass-key.png'
config.window_background_image_hsb = {
    -- darken the background image
    brightness = 0.3,
}

return config
