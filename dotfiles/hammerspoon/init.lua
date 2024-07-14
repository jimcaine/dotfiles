local hyper = {"ctrl", "alt", "cmd"}

-- hs.loadSpoon("MiroWindowsManager")

local wm = require('window-management')

hs.hotkey.bind(hyper, "space", function()
  wm.windowMaximize(0)
end)

hs.hotkey.bind(hyper, "7", function()
  wm.moveWindowToPosition(wm.screenPositions.halves_left)
end)

hs.hotkey.bind(hyper, "8", function()
  wm.moveWindowToPosition(wm.screenPositions.twothirds_left)
end)

hs.hotkey.bind(hyper, "9", function()
  wm.moveWindowToPosition(wm.screenPositions.twothirds_right)
end)

hs.hotkey.bind(hyper, "0", function()
  wm.moveWindowToPosition(wm.screenPositions.halves_right)
end)

hs.hotkey.bind(hyper, "right", function()
  wm.moveWindowToPosition(wm.screenPositions.right)
end)

hs.hotkey.bind(hyper, "left", function()
  wm.moveWindowToPosition(wm.screenPositions.left)
end)

hs.hotkey.bind(hyper, "up", function()
  wm.moveWindowToPosition(wm.screenPositions.top)
end)

hs.hotkey.bind(hyper, "down", function()
  wm.moveWindowToPosition(wm.screenPositions.bottom)
end)

hs.hotkey.bind(hyper, "u", function()
  wm.moveWindowToPosition(wm.screenPositions.u1)
end)

hs.hotkey.bind(hyper, "i", function()
  wm.moveWindowToPosition(wm.screenPositions.u2)
end)

hs.hotkey.bind(hyper, "o", function()
  wm.moveWindowToPosition(wm.screenPositions.u3)
end)

hs.hotkey.bind(hyper, "p", function()
  wm.moveWindowToPosition(wm.screenPositions.u4)
end)

hs.hotkey.bind(hyper, "m", function()
  wm.moveWindowToPosition(wm.screenPositions.l1)
end)

hs.hotkey.bind(hyper, ",", function()
  wm.moveWindowToPosition(wm.screenPositions.l2)
end)

hs.hotkey.bind(hyper, ".", function()
  wm.moveWindowToPosition(wm.screenPositions.l3)
end)

hs.hotkey.bind(hyper, "j", function()
  wm.moveWindowToPosition(wm.screenPositions.left)
end)

hs.hotkey.bind(hyper, "k", function()
  wm.moveWindowToPosition(wm.screenPositions.mid)
end)

hs.hotkey.bind(hyper, "l", function()
  wm.moveWindowToPosition(wm.screenPositions.right)
end)
