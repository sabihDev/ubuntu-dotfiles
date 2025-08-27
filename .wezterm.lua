-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = wezterm.config_builder()

-- Font settings
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 19

-- Window settings
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

-- Colors
config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

-- ==========================
-- Mouse-related settings
-- ==========================

-- Force reverse video cursor for better visibility
config.force_reverse_video_cursor = true

-- Enable mouse support inside apps (like vim, tmux)
config.enable_title_reporting = true

-- Improve scroll behavior
config.adjust_window_size_when_changing_font_size = false
config.scrollback_lines = 5000
config.enable_scroll_bar = false
config.swallow_mouse_click_on_pane_focus = true

-- Frontend & cursor rendering options (try switching if cursor disappears)
-- "OpenGL" is default, but you can try "Software" if issues persist
config.front_end = "OpenGL"

-- On some Linux/Wayland setups, disabling hardware cursor helps
-- Uncomment this if cursor still disappears
config.force_disable_hardware_cursor = true
config.enable_wayland = false

-- ==========================

return config
