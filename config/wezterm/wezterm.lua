local wezterm = require("wezterm")
local config = wezterm.config_builder()

-------------------------------------------------
-- https://wezfurlong.org/wezterm/config/lua/config/index.html
-------------------------------------------------

-- text and fonts
config.font_size = 16
config.adjust_window_size_when_changing_font_size = false
config.selection_word_boundary = " {}[]()\"'`,;:"
-- turn off italic
config.font_rules = {
  { italic = true, font = wezterm.font("JetBrains Mono") },
}

-- colors
config.color_scheme = "Tokyo Night"

-- tabs
config.hide_tab_bar_if_only_one_tab = true
-- config.show_close_tab_button_in_tabs = false
-- config.show_new_tab_button_in_tab_bar = false
-- config.show_tab_index_in_tab_bar = false
-- config.show_tabs_in_tab_bar = false
-- config.use_fancy_tab_bar = false
config.enable_tab_bar = false

-- windows
config.initial_cols = 120
config.initial_rows = 35
config.window_padding = {
  left = 5,
  right = 5,
  top = 5,
  bottom = 5,
}

-- local overrides
local status, module = pcall(require, "local")
if status then
  module.adjust(config)
end

return config
