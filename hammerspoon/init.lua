
function bindMove(mods, key, logic)
  hs.hotkey.bind(mods, key, function()
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    local winFrame = win:frame()
    logic(winFrame, screen:frame())
    win:setFrame(winFrame, 0.1)
  end)
end

-- -------------------------------------------------
-- move
-- -------------------------------------------------

bindMove({"ctrl", "alt"}, "=", function(win, screen)
  win.x = screen.w / 2 - win.w / 2
  win.y = screen.h / 2 - win.h / 2
end)

bindMove({"ctrl", "alt"}, "left", function(win, screen)
  win.x = screen.x
end)

bindMove({"ctrl", "alt"}, "right", function(win, screen)
  win.x = screen.x + screen.w - win.w
end)

bindMove({"ctrl", "alt"}, "up", function(win, screen)
  win.y = screen.y
end)

bindMove({"ctrl", "alt"}, "down", function(win, screen)
  win.y = screen.y + screen.h - win.h
end)

-- -------------------------------------------------
-- resize, maybe move
-- -------------------------------------------------

-- large: full-width
bindMove({"ctrl", "alt"}, "l", function(win, screen)
  win.x = screen.x
  win.w = screen.w
end)

-- tall: full-height
bindMove({"ctrl", "alt"}, "t", function(win, screen)
  win.y = screen.y
  win.h = screen.h
end)

-- browser-width
bindMove({"ctrl", "alt"}, "b", function(win, screen)
  win.w = 1250
  win.x = math.min(win.x, screen.x + screen.w - win.w)
end)

-- wide
bindMove({"ctrl", "alt"}, "w", function(win, screen)
  win.w = 1400
  win.x = math.min(win.x, screen.x + screen.w - win.w)
end)

-- restricted
bindMove({"ctrl", "alt"}, "r", function(win, screen)
  win.x = 300
  win.w = 780
end)

-- -------------------------------------------------
-- mouse resize
-- -------------------------------------------------

-- mouse, resize to mouse
bindMove({"ctrl", "alt"}, "m", function(win, screen)
  mouse = hs.mouse.getRelativePosition()
  win.w = mouse.x - win.x
  win.h = mouse.y - win.y
end)

