--- === CtrlArrows ===
---
--- Use ctrl + `h/l/j/k` as arrow keys
---
--- Download: [https://github.com/Hammerspoon/Spoons/raw/master/Spoons/ctrlMate.spoon.zip](https://github.com/Hammerspoon/Spoons/raw/master/Spoons/ctrlMate.spoon.zip)

local obj = {}
obj.__index = obj

-- Metadata
obj.name = "CtrlArrows"
obj.version = "1.0"
obj.author = "caseydean8@gmail.com"
-- obj.homepage = "https://github.com/Hammerspoon/Spoons"
obj.license = "MIT - https://opensource.org/licenses/MIT"

function obj:init()
  hs.hotkey.bind({ "ctrl" }, "h", function()
    hs.eventtap.keyStroke({}, "left")
  end)
  hs.hotkey.bind({ "ctrl" }, "j", function()
    hs.eventtap.keyStroke({}, "down")
  end)
  hs.hotkey.bind({ "ctrl" }, "k", function()
    hs.eventtap.keyStroke({}, "up")
  end)
  hs.hotkey.bind({ "ctrl" }, "l", function()
    hs.eventtap.keyStroke({}, "right")
  end)
end

return obj
-- function obj:init()
--   local function catcher(event)
--     local flags = event:getFlags()
--     local ctrlKey = flags.control
--     if ctrlKey and event:getCharacters() == "h" then
--       return true, { hs.eventtap.event.newKeyEvent({}, "left", true) }
--     elseif ctrlKey and event:getCharacters() == "l" then
--       return true, { hs.eventtap.event.newKeyEvent({}, "right", true) }
--     elseif ctrlKey and event:getCharacters() == "j" then
--       return true, { hs.eventtap.event.newKeyEvent({}, "down", true) }
--     elseif ctrlKey and event:getCharacters() == "k" then
--       return true, { hs.eventtap.event.newKeyEvent({}, "up", true) }
--     end
--   end
--   fn_tapper = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, catcher):start()
-- end

-- return obj


-- function obj:init()
--   local arrowHotkeys = {
--     h = hs.keycodes.map.left,
--     j = hs.keycodes.map.down,
--     l = hs.keycodes.map.right,
--     k = hs.keycodes.map.up
--   }
--   for key, arrow in pairs(arrowHotkeys) do
--     hs.hotkey.bind({ 'ctrl' }, key, function()
--       hs.eventtap.keyStroke(nil, arrow)
--     end)
--     -- On macOS, alt+arrow moves over  a word
--     -- cmd+arrow mover over a line
--     -- alt+shift+arrow selects a word
--     -- cmd+shift+arrow selects a line
--     hs.hotkey.bind({ 'ctrl', 's' }, key, function()
--       hs.eventtap.keyStroke('alt', arrow)
--     end)
--     hs.hotkey.bind({ 'ctrl', 'cmd' }, key, function()
--       hs.eventtap.keyStroke('cmd', arrow)
--     end)
--     hs.hotkey.bind({ 'ctrl', 'cmd', 'shift' }, key, function()
--       hs.eventtap.keyStroke({ 'cmd', 'shift' }, arrow)
--     end)
--     hs.hotkey.bind({ 'ctrl', 'alt', 'shift' }, key, function()
--       hs.eventtap.keyStroke({ 'alt', 'shift' }, arrow)
--     end)
--   end
-- end

-- return obj
