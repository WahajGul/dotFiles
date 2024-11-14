-- ~/.config/awesome/widget/tasklist.lua

local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local tasklist_widget = {}
local tasklist_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end
	end),
	awful.button({}, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),
	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
	end),
	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
	end)
)

function tasklist_widget.create(s)
	return awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
		style = {
			shape_border_width = 1,
			shape_border_color = "#777777",
			shape = gears.shape.rounded_rect,
		},
		layout = {
			spacing = 0,
			layout = wibox.layout.flex.horizontal,
		},
		widget_template = {
			{
				{
					{
						id = "icon_role",
						widget = wibox.widget.imagebox,
					},
					margins = 2,
					widget = wibox.container.margin,
				},
				layout = wibox.layout.fixed.horizontal,
			},
			id = "background_role",
			forced_width = 8,
			widget = wibox.container.background,
			create_callback = function(self, c, _, _)
				if c == client.focus then
					self.bg = beautiful.tasklist_bg_focus or "#bd20b7" -- Red background for focused window
				else
					self.bg = beautiful.tasklist_bg_normal or "#410a3f"
				end
			end,
			update_callback = function(self, c, _, _)
				if c == client.focus then
					self.bg = beautiful.tasklist_bg_focus or "#bd20b7"
				else
					self.bg = beautiful.tasklist_bg_normal or "#410a3f"
				end
			end,
		},
	})
end

return tasklist_widget
