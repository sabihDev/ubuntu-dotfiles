local wezterm = require('wezterm')
local constants = require('constants')
local config = wezterm.config_builder()

-- Font configurations
config.font = wezterm.font('JetBrains Mono')
config.font_size = 16
config.line_height = 1.2

-- Color configurations
config.colors = {
  cursor_bg = '#ffffff',
  cursor_border = '#ffffff',
}

-- Appearance settings
config.window_decorations = 'RESIZE'
config.hide_tab_bar_if_only_one_tab = true
config.window_background_image = constants.bg_image
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.font = wezterm.font 'Fira Code'
-- You can specify some parameters to influence the font selection;
-- for example, this selects a Bold, Italic font variant.
config.font =
  wezterm.font('JetBrains Mono', { weight = 'Bold', italic = true })
return config
