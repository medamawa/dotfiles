local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Identify wezterm
config.set_environment_variables = {
	WEZTERM = "1",
}

config.font = wezterm.font({
	family = "JetBrains Mono",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})
config.font_size = 14

config.color_scheme = "tokyonight"
config.window_background_opacity = 0.8
config.initial_cols = 140
config.initial_rows = 36

return config
