
hydra.alert("hydra", 1.5)

local mash = {"ctrl", "alt"}

require "ftw"

-- -------------------------------------------------

-- save the time when updates are checked
function checkforupdates()
  updates.check()
  settings.set('lastcheckedupdates', os.time())
end

-- show a helpful menu
menu.show(function()
    local updatetitles = {[true] = "Install Update", [false] = "Check for Update..."}
    local updatefns = {[true] = updates.install, [false] = checkforupdates}
    local hasupdate = (updates.newversion ~= nil)

    return {
      {title = "Reload Config", fn = hydra.reload},
      {title = "Open REPL", fn = repl.open},
      {title = "-"},
      {title = "About", fn = hydra.showabout},
      {title = updatetitles[hasupdate], fn = updatefns[hasupdate]},
      {title = "Quit Hydra", fn = os.exit},
    }
end)

-- show available updates
local function showupdate()
  os.execute('open https://github.com/sdegutis/Hydra/releases')
end

-- what to do when an update is checked
function updates.available(available)
  if available then
    notify.show("Hydra update available", "", "Click here to see the changelog and maybe even install it", "showupdate")
  else
    hydra.alert("No update available.")
  end
end

-- Uncomment this if you want Hydra to make sure it launches at login
-- autolaunch.set(true)

-- check for updates every week
timer.new(timer.weeks(1), checkforupdates):start()
notify.register("showupdate", showupdate)

-- if this is your first time running Hydra, you're launching it more than a week later, check now
local lastcheckedupdates = settings.get('lastcheckedupdates')
if lastcheckedupdates == nil or lastcheckedupdates <= os.time() - timer.days(7) then
  checkforupdates()
end

-- -------------------------------------------------

hotkey.bind(mash, "Left",  ext.ftw.move_left)
hotkey.bind(mash, "Right", ext.ftw.move_right)
hotkey.bind(mash, "Up",    ext.ftw.move_up)
hotkey.bind(mash, "Down",  ext.ftw.move_down)
hotkey.bind(mash, "=",     ext.ftw.move_center)

-- browser, 1150 x SCREEN_HEIGHT, move right
hotkey.bind(mash, "b", function ()
  local BROWSER_WIDTH = 1150
  ext.ftw.move(function (winframe, screenframe, point)
    point.x = screenframe.w - BROWSER_WIDTH
    point.y = screenframe.y
  end)
  ext.ftw.size(function (winframe, screenframe, size)
    size.w = BROWSER_WIDTH
    size.h = screenframe.h
  end)
end)

hotkey.bind(mash, "i", function () application.launchorfocus("iTerm") end)
hotkey.bind(mash, "c", function () application.launchorfocus("Google Chrome") end)

-- -------------------------------------------------

function show(value)
  logger.lines = {}
  table.insert(logger.lines, json.encode(value))
  logger.show()
end

