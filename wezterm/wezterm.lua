-- WezTerm Configuration
local wezterm = require 'wezterm'
local config = {}

-- color scheme
config.color_scheme = 'Catppuccin Mocha'

-- background image
config.window_background_image = '/home/lemonsir/.config/wezterm/glass-key.png'
-- config.window_background_image = '/home/lemonsir/.config/wezterm/nausicaa.jpg'
config.window_background_image_hsb = {
    -- hue
    hue = 1.0,

    -- saturation
    saturation = 1.0,

    -- brightness
    brightness = 0.05,
}

-- fonts
config.font = wezterm.font 'DM Mono'
config.font_size = 11.0

return config
