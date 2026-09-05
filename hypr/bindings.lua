-- Custom keybindings migrated from the pre-Quattro Hyprland configuration.
-- Omarchy defaults stay enabled; each custom key is unbound before it is
-- rebound so a package default and a personal binding never fire together.

local function rebind(keys, description, dispatcher, options)
  hl.unbind(keys)
  o.bind(keys, description, dispatcher, options)
end

-- Preserved system bindings.
rebind("SUPER + L", "Lock system", "omarchy-system-lock")
rebind("SUPER + SHIFT + E", "Logout", "omarchy-system-logout")
rebind("SUPER + SHIFT + CTRL + R", "Reload Hyprland", "hyprctl reload")
rebind("SUPER + ESCAPE", "System menu", "omarchy-menu toggle system")
rebind("ALT + CTRL + SPACE", "Omarchy menu", "omarchy-menu toggle")
rebind("SUPER + H", "Hardware menu", "omarchy-menu toggle hardware")
rebind("SUPER + K", "Keybindings", "omarchy-menu-keybindings")

rebind("SUPER + CTRL + SPACE", "Background switcher", "omarchy-menu toggle background")
rebind("SUPER + SHIFT + CTRL + SPACE", "Theme menu", "omarchy-menu toggle theme")
rebind("SUPER + BACKSPACE", "Toggle window transparency", "omarchy-hyprland-window-transparency-toggle")
rebind("SUPER + SHIFT + BACKSPACE", "Toggle window gaps", "omarchy-hyprland-window-gaps-toggle")

rebind("SUPER + comma", "Dismiss last notification", "omarchy-shell notifications dismissOne")
rebind("SUPER + SHIFT + comma", "Dismiss all notifications", "omarchy-shell notifications dismissAll")
rebind("SUPER + CTRL + comma", "Toggle silencing notifications", "omarchy-toggle-notification-silencing")
rebind("SUPER + CTRL + I", "Toggle locking on idle", "omarchy-toggle-idle")
rebind("SUPER + CTRL + N", "Toggle nightlight", "omarchy-toggle-nightlight")

rebind("SUPER + PRINT", "Color picker", "pkill hyprpicker || hyprpicker -a")
rebind("PRINT", "Screenshot", "omarchy-capture-screenshot")
rebind("SUPER + CTRL + A", "Audio", "omarchy-shell shell toggle omarchy.audio")
rebind("SUPER + CTRL + B", "Bluetooth", "omarchy-shell shell toggle omarchy.bluetooth")
rebind("SUPER + CTRL + W", "Network", "omarchy-shell shell toggle omarchy.network")
rebind("SUPER + CTRL + T", "Activity", { tui = "btop" })
rebind("SUPER + CTRL + S", "Share", "omarchy-menu toggle share")

-- Web applications moved away from Super to avoid window-manager conflicts.
rebind("ALT + CTRL + A", "ChatGPT", { webapp = "https://chatgpt.com" })
rebind("ALT + CTRL + SHIFT + A", "Grok", { webapp = "https://grok.com" })
rebind("ALT + CTRL + C", "Calendar", { webapp = "https://app.hey.com/calendar/weeks/" })
rebind("ALT + CTRL + E", "Email", { webapp = "https://app.hey.com" })
rebind("ALT + CTRL + Y", "YouTube", { webapp = "https://youtube.com/" })
rebind("ALT + CTRL + G", "WhatsApp", { webapp = "https://web.whatsapp.com/", focus = true })
rebind("ALT + CTRL + SHIFT + G", "Google Messages", { webapp = "https://messages.google.com/web/conversations", focus = true })
rebind("ALT + CTRL + P", "Google Photos", { webapp = "https://photos.google.com/", focus = true })
rebind("ALT + CTRL + X", "X", { webapp = "https://x.com/" })
rebind("ALT + CTRL + SHIFT + X", "X Post", { webapp = "https://x.com/compose/post" })

rebind("ALT + CTRL + SHIFT + S", "Signal", { omarchy = "signal" })
rebind("ALT + SHIFT + O", "Obsidian", { launch = "obsidian", focus = "^obsidian$" })
rebind("ALT + SHIFT + W", "Typora", { launch = "typora --enable-wayland-ime" })
rebind("ALT + SHIFT + SLASH", "Passwords", { omarchy = "1password" })

-- GlazeWM-style close, focus, and movement controls.
rebind("ALT + SHIFT + Q", "Close window", hl.dsp.window.close())
rebind("ALT + SHIFT + CTRL + Q", "Close all windows", "omarchy-hyprland-window-close-all")

local directions = {
  { key = "H", arrow = "LEFT", direction = "l", label = "left" },
  { key = "J", arrow = "DOWN", direction = "d", label = "down" },
  { key = "K", arrow = "UP", direction = "u", label = "up" },
  { key = "L", arrow = "RIGHT", direction = "r", label = "right" },
}

for _, item in ipairs(directions) do
  rebind("ALT + " .. item.key, "Focus " .. item.label .. " window", hl.dsp.focus({ direction = item.direction }))
  rebind("ALT + " .. item.arrow, "Focus " .. item.label .. " window", hl.dsp.focus({ direction = item.direction }))
  rebind("ALT + SHIFT + " .. item.key, "Move window " .. item.label, hl.dsp.window.swap({ direction = item.direction }))
  rebind("ALT + SHIFT + " .. item.arrow, "Move window " .. item.label, hl.dsp.window.swap({ direction = item.direction }))
end

-- GlazeWM-style workspace controls.
for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  rebind("ALT + " .. key, "Switch to workspace " .. workspace, hl.dsp.focus({ workspace = tostring(workspace) }))
  rebind("ALT + SHIFT + " .. key, "Move window to workspace " .. workspace, hl.dsp.window.move({ workspace = tostring(workspace) }))
end

-- Layout controls.
rebind("ALT + X", "Maximize window", "hyprctl dispatch fullscreenstate 0 2")
rebind("SUPER + F", "Full screen", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
rebind("ALT + CTRL + F", "Tiled full screen", "omarchy-hyprland-window-tiled-fullscreen-toggle")
rebind("ALT + SHIFT + F", "Full width", hl.dsp.window.fullscreen({ mode = "maximized" }))

rebind("ALT + A", "Previous workspace", hl.dsp.focus({ workspace = "-1" }))
rebind("ALT + S", "Next workspace", hl.dsp.focus({ workspace = "+1" }))
rebind("ALT + SHIFT + A", "Move window to previous workspace", hl.dsp.window.move({ workspace = "-1" }))
rebind("ALT + SHIFT + S", "Move window to next workspace", hl.dsp.window.move({ workspace = "+1" }))

rebind("ALT + SHIFT + SPACE", "Toggle floating", hl.dsp.window.float({ action = "toggle" }))
rebind("ALT + V", "Toggle split direction", hl.dsp.layout("togglesplit"))
rebind("ALT + P", "Pseudo window", hl.dsp.window.pseudo())
rebind("ALT + O", "Pop window out (float & pin)", "omarchy-hyprland-window-pop")

-- GlazeWM-style application launchers.
rebind("ALT + RETURN", "Terminal", { omarchy = "terminal" })
rebind("ALT + CTRL + RETURN", "Tmux", { omarchy = "terminal-tmux" })
rebind("ALT + SHIFT + RETURN", "Browser", { omarchy = "browser" })
rebind("ALT + SHIFT + E", "File manager", { omarchy = "nautilus" })
rebind("ALT + CTRL + SHIFT + F", "File manager (cwd)", { omarchy = "nautilus-cwd" })
rebind("ALT + CTRL + SHIFT + B", "Browser (private)", { omarchy = "browser --private" })
rebind("ALT + CTRL + M", "Music", { omarchy = "spotify" })
rebind("ALT + SHIFT + N", "Editor", { omarchy = "editor" })
rebind("ALT + SHIFT + D", "Docker", { tui = "lazydocker" })

-- Scratchpad moved to the physical S key. Remove the symbol-based defaults
-- first, including Google Maps on Super+Shift+S.
hl.unbind("SUPER + S")
hl.unbind("SUPER + ALT + S")
hl.unbind("SUPER + SHIFT + S")
rebind("SUPER + code:39", "Toggle scratchpad", hl.dsp.workspace.toggle_special("scratchpad"))
rebind("SUPER + SHIFT + code:39", "Move window to scratchpad", hl.dsp.window.move({ workspace = "special:scratchpad" }))

-- Window grouping.
rebind("ALT + G", "Toggle grouping", hl.dsp.group.toggle())
rebind("ALT + SHIFT + G", "Move out of group", hl.dsp.window.move({ out_of_group = true }))
for _, item in ipairs(directions) do
  rebind("ALT + CTRL + " .. item.key, "Join group " .. item.label, hl.dsp.window.move({ into_group = item.direction }))
end
rebind("ALT + CTRL + SHIFT + L", "Toggle workspace layout", "omarchy-hyprland-workspace-layout-toggle")

-- Monitor focus. These replace Hardware, Lock, and Herdr defaults on H/L/K.
for _, item in ipairs(directions) do
  rebind("SUPER + CTRL + " .. item.key, "Focus " .. item.label .. " monitor", hl.dsp.focus({ monitor = item.direction }))
end

-- Screenshot overrides. Alt+Print replaces Omarchy's screen-recording default.
rebind("ALT + PRINT", "Screenshot", "omarchy-capture-screenshot")
rebind("ALT + SHIFT + PRINT", "Screenshot area", "omarchy-capture-screenshot region")
