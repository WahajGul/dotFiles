local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

-- Sound widget
local sound_widget = wibox.widget({
	{
		{
			id = "icon",
			widget = wibox.widget.textbox,
			font = "0xProto Nerd Font 12", -- Set the font for the icon
		},
		{
			id = "volume",
			widget = wibox.widget.textbox,
			font = beautiful.font,
		},
		layout = wibox.layout.fixed.horizontal,
	},
	left = 8, -- Add 8 pixels of space to the left
	right = 8,
	widget = wibox.container.margin,
})

-- Set the foreground color to purple
local sound_widget_container = wibox.widget({
	sound_widget,
	bg = "#1A1A1D",
	fg = "#fd60ff", -- Purple color
	widget = wibox.container.background,
})

-- Function to set volume and icon based on status
local function set_volume(widget, volume, muted)
	local icon_widget = widget:get_children_by_id("icon")[1]
	local volume_widget = widget:get_children_by_id("volume")[1]

	if muted == "off" then
		icon_widget.text = "󰖁 " -- Mute icon
	else
		if tonumber(volume) > 70 then
			icon_widget.text = "󰕾 " -- High volume icon
		elseif tonumber(volume) > 30 then
			icon_widget.text = "󰖀 " -- Medium volume icon
		else
			icon_widget.text = "󰕿 " -- Low volume icon
		end
	end
	volume_widget.text = "" .. volume .. "%"
end

-- Function to update the sound widget
local function update_sound_widget()
	awful.spawn.easy_async_with_shell("amixer get Master", function(stdout)
		local volume = stdout:match("(%d?%d?%d)%%") or "0"
		local muted = stdout:match("%[(o[nf]*)%]") or "off"
		set_volume(sound_widget, volume, muted)
	end)
end

-- Initial update and periodic refresh
update_sound_widget()
gears.timer({
	timeout = 5,
	autostart = true,
	callback = update_sound_widget,
})

-- Click to toggle mute and adjust volume
sound_widget:connect_signal("button::press", function(_, _, _, button)
	if button == 1 then
		awful.spawn("amixer set Master toggle", false)
		update_sound_widget()
	elseif button == 4 then
		awful.spawn("amixer set Master 5%+", false)
		update_sound_widget()
	elseif button == 5 then
		awful.spawn("amixer set Master 5%-", false)
		update_sound_widget()
	end
end)

return sound_widget_container
