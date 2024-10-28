-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = {}
config.default_prog = { 'nu' }
-- This will hold the configuration.
if wezterm.config_builder then
    config = wezterm.config_builder()
  end
-- This is where you actually apply your config choices

config.default_prog = { 'nu' }

config.font = wezterm.font 'JetBrainsMono NF'
config.font_size = 12
config.window_background_opacity = 0.8
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.use_fancy_tab_bar = false
config.color_scheme = 'One Dark (Gogh)'
config.hide_tab_bar_if_only_one_tab = true

-- and finally, return the configuration to wezterm

return config
