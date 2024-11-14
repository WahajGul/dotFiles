local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local awful = require("awful")
local wibox.widget = require("wibox.widget")

local function get_wifi_info()
    -- ... (same as before)
end

local function update_wifi_info()
    local status, level = get_wifi_info()
    local icon = ""
    if status == "Disconnected" then
        icon = "" -- WiFi disconnected icon
    else
        if level <= 25 then
            icon = "" -- Low WiFi signal icon
        elseif level <= 50 then
            icon = "" -- Medium WiFi signal icon
        elseif level <= 75 then
            icon = "" -- High WiFi signal icon
        else
            icon = "" -- Full WiFi signal icon
        end
    end
    wifi_widget:set_text(string.format("%s %s (%s dBm)", icon, status, level))
end

local wifi_widget = wibox.widget.textbox()
wifi_widget:set_font(beautiful.font)
wifi_widget:set_align("center")
wifi_widget:set_valign("center")

awful.widget.add_timer(update_wifi_info, 5) -- Update every 5 seconds

return wifi_widget
