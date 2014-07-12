ext.ftw = {}

function ext.ftw.win_frames(callback)
  local win = window.focusedwindow()
  local winframe = win:frame()
  local screenframe = window.focusedwindow():screen():frame_including_dock_and_menu()
  callback(win, winframe, screenframe)
end

function ext.ftw.move(callback)
  ext.ftw.win_frames(function (win, winframe, screenframe)
    local point = win:topleft()
    callback(winframe, screenframe, point)
    win:settopleft(point)
  end)
end

function ext.ftw.size(callback)
  ext.ftw.win_frames(function (win, winframe, screenframe)
    local size = win:size()
    callback(winframe, screenframe, size)
    win:setsize(size)
  end)
end

-- -------------------------------------------------

function ext.ftw.move_left()
  ext.ftw.move(function (winframe, screenframe, point)
    point.x = screenframe.x
  end)
end

function ext.ftw.move_right()
  ext.ftw.move(function (winframe, screenframe, point)
    point.x = screenframe.w - winframe.w
  end)
end

function ext.ftw.move_up()
  ext.ftw.move(function (winframe, screenframe, point)
    point.y = screenframe.y
  end)
end

function ext.ftw.move_down()
  ext.ftw.move(function (winframe, screenframe, point)
    point.y = screenframe.h - winframe.h
  end)
end

function ext.ftw.move_center()
  ext.ftw.move(function (winframe, screenframe, point)
    point.x = (screenframe.w - winframe.w) / 2
    point.y = (screenframe.h - winframe.h) / 2
  end)
end
