-- ~/.config/awesome/widget/textclock.lua

local wibox = require("wibox")
local beautiful = require("beautiful")

-- Create the text clock widget
local textclock_widget = wibox.widget({
	{
		{
			widget = wibox.widget.textclock("%I:%M%p %a,%d%b", 1), -- Define the clock format and refresh rate
			font = beautiful.font, -- Use the font defined in your theme
		},
		left = 8, -- Add 8 pixels of space to the left
		right = 8,
		widget = wibox.container.margin,
	},
	bg = "#1A1A1D", -- Background color
	fg = "#fd60ff", -- Foreground color (purple)
	widget = wibox.container.background,
})

return textclock_widget
