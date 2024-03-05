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

config.font = wezterm.font 'JetBrainsMono NFM'
config.font_size = 16
config.window_background_opacity = 0.88
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_background_gradient = {
    interpolation = 'Linear',
  
    orientation = 'Vertical',
  
    blend = 'Rgb',
  
    colors = {
      '#11111b',
      '#181825',
    },
  }
  
  config.use_fancy_tab_bar = false
  


  

-- and finally, return the configuration to wezterm


return config
