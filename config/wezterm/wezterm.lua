local wezterm = require("wezterm")
local config = wezterm.config_builder()

-------------------------------------------------
-- https://wezfurlong.org/wezterm/config/lua/config/index.html
-------------------------------------------------

-- text and fonts
config.font_size = 16
config.adjust_window_size_when_changing_font_size = false
config.selection_word_boundary = " {}[]()\"'`,;:"

-- colors
config.color_scheme = "Tokyo Night"

-- tabs
config.hide_tab_bar_if_only_one_tab = true

-- windows
config.initial_cols = 120
config.initial_rows = 35
config.window_padding = {
  left = 5,
  right = 5,
  top = 5,
  bottom = 5,
}

return config
