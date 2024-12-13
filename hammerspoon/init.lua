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

bindMove({ "ctrl", "alt" }, "=", function(win, screen)
  win.x = screen.x + screen.w / 2 - win.w / 2
  win.y = screen.y + screen.h / 2 - win.h / 2
end)

bindMove({ "ctrl", "alt" }, "left", function(win, screen)
  win.x = screen.x
end)

bindMove({ "ctrl", "alt" }, "right", function(win, screen)
  win.x = screen.x + screen.w - win.w
end)

bindMove({ "ctrl", "alt" }, "up", function(win, screen)
  -- vertical space for teams...
  if win.y == screen.y then
    win.y = screen.y + 25
    return
  end
  -- vertical space for teams...
  if win.y == screen.y + 25 then
    win.y = screen.y + 50
    return
  end
  win.y = screen.y
end)

bindMove({ "ctrl", "alt" }, "down", function(win, screen)
  win.y = screen.y + screen.h - win.h
end)

-- -------------------------------------------------
-- resize, maybe move
-- -------------------------------------------------

-- large: full-width
bindMove({ "ctrl", "alt" }, "l", function(win, screen)
  win.x = screen.x
  win.w = screen.w
end)

-- tall: full-height
bindMove({ "ctrl", "alt" }, "t", function(win, screen)
  win.y = screen.y
  win.h = screen.h
end)

-- browser-width
bindMove({ "ctrl", "alt" }, "b", function(win, screen)
  win.w = 1250
  win.x = math.min(win.x, screen.x + screen.w - win.w)
end)

-- wide
bindMove({ "ctrl", "alt" }, "w", function(win, screen)
  win.w = 1400
  win.x = math.min(win.x, screen.x + screen.w - win.w)
end)

-- restricted
bindMove({ "ctrl", "alt" }, "r", function(win, screen)
  win.x = 300
  win.w = 1000
end)

-- fit
bindMove({ "ctrl", "alt" }, "f", function(win, screen)
  win.w = screen.x + screen.w - win.x
  win.h = screen.y + screen.h - win.y
end)

-- both t and w
bindMove({ "ctrl", "alt" }, "o", function(win, screen)
  win.w = 1400
  win.x = math.min(win.x, screen.x + screen.w - win.w)
  win.y = screen.y
  win.h = screen.h
end)
