local colors = require("features.ui.colors")
local values = require("config.values")

return function(custom_theme)
	custom_theme.insert.a.bg = colors.bg_a
	custom_theme.normal.b.fg = colors.fg_b
	if values.theme.transparent then
		custom_theme.normal.c.bg = "none"
		custom_theme.normal.b.bg = "none"
    custom_theme.insert.b.bg = "none"
    custom_theme.insert.b.fg = colors.fg_b_i
	else
		custom_theme.normal.b.bg = colors.bg_b
	end

	return custom_theme
end
