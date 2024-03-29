hs.loadSpoon("FnMate")
hs.loadSpoon("AppBindings")

function appBinder(app)
  spoon.AppBindings:bind(app, {
    { { 'ctrl' }, 'j', {}, 'down' },
    { { 'ctrl' }, 'k', {}, 'up' },
    { { 'ctrl' }, 'h', {}, 'left' },
    { { 'ctrl' }, 'l', {}, 'right' },
    -- Go to end of line.
    { { 'ctrl' }, ';', { 'cmd' }, 'right' },
    { {'ctrl'}, [[']], {'cmd', 'shift'}, 'right'},
  })
end

apps = {'Notes', 'Anki','Firefox Developer Edition', 'TextEdit', 'System Preferences', 'Safari', 'Visual Studio',
 'Azure Data Studio', 'Preview', 'AltTab', 'MySQLWorkbench', 'MySQLWorkbench', 'Numbers', 'Brave Browser', 'Microsoft Edge', 'Google Chrome',
'Pages', 'Postman', 'App Store', 'LibreWolf'
}
for i, app in ipairs(apps) do
  appBinder(app)
end

spoon.AppBindings:bind('Warp', {
  { { 'cmd' }, 's', { 'space' }, 'w' },
})

function reloadConfig(files)
  doReload = false
  for _, file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end

myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

-- warp cmd w off
-- TODO make another hotkey to close window
-- TODO make github repo
warpCmdWOff = hs.hotkey.new({ "cmd" }, "W", function()
  hs.alert.show("hit <space> w")
end)

local WarpWindowFilter = hs.window.filter.new("Warp")

WarpWindowFilter
    :subscribe(hs.window.filter.windowFocused, function()
      warpCmdWOff:enable()
    end)
    :subscribe(hs.window.filter.windowUnfocused, function()
      warpCmdWOff:disable()
    end)


function appId(app)
  return hs.application.infoforBundlePath(app)['CFBundleIdentifier']
end

function escapeKey()
  hs.eventtap.keyStroke({}, 'escape')
end

-- local escapeMap = {}
