local This = {}

local GRID_SIZE = 12
local NUM_COLS = 3
local UPPER_HEIGHT = 9
local WIDTH = GRID_SIZE / NUM_COLS
local LOWER_HEIGHT = GRID_SIZE - UPPER_HEIGHT
local HALF_GRID_SIZE = GRID_SIZE / 2

hs.grid.setGrid(GRID_SIZE .. 'x' .. GRID_SIZE)
hs.grid.setMargins({5, 5})
hs.window.animationDuration = 0.2

local screenPositions = {}

screenPositions.center = {
  x = GRID_SIZE - 1,
  y = GRID_SIZE - 1,
  w = GRID_SIZE - 2,
  h = GRID_SIZE - 2,
}

screenPositions.halves_left = {
  x = 0,
  y = 0,
  w = HALF_GRID_SIZE,
  h = GRID_SIZE,
}

screenPositions.halves_right = {
  x = HALF_GRID_SIZE,
  y = 0,
  w = HALF_GRID_SIZE,
  h = GRID_SIZE,
}

screenPositions.twothirds_left = {
  x = 0,
  y = 0,
  w = WIDTH * 2,
  h = GRID_SIZE,
}

screenPositions.twothirds_right = {
  x = WIDTH,
  y = 0,
  w = WIDTH * 2,
  h = GRID_SIZE,
}

screenPositions.u1 = {
  x = 0,
  y = 0,
  w = WIDTH,
  h = UPPER_HEIGHT,
}

screenPositions.u2 = {
  x = WIDTH,
  y = 0,
  w = WIDTH,
  h = UPPER_HEIGHT,
}

screenPositions.u3 = {
  x = WIDTH * 2,
  y = 0,
  w = WIDTH,
  h = UPPER_HEIGHT,
}

screenPositions.u4 = {
  x = WIDTH * 3,
  y = 0,
  w = WIDTH,
  h = UPPER_HEIGHT,
}

screenPositions.l1 = {
  x = 0,
  y = UPPER_HEIGHT,
  w = WIDTH,
  h = LOWER_HEIGHT,
}

screenPositions.l2 = {
  x = WIDTH,
  y = UPPER_HEIGHT,
  w = WIDTH,
  h = LOWER_HEIGHT,
}

screenPositions.l3 = {
  x = WIDTH * 2,
  y = UPPER_HEIGHT,
  w = WIDTH,
  h = LOWER_HEIGHT,
}

screenPositions.l4 = {
  x = WIDTH * 3,
  y = UPPER_HEIGHT,
  w = WIDTH,
  h = LOWER_HEIGHT,
}

screenPositions.left = {
  x = 0,
  y = 0,
  w = WIDTH,
  h = GRID_SIZE,
}

screenPositions.right = {
  x = WIDTH * 2,
  y = 0,
  w = WIDTH,
  h = GRID_SIZE,
}

screenPositions.mid = {
  x = WIDTH,
  y = 0,
  w = WIDTH,
  h = GRID_SIZE,
}

This.screenPositions = screenPositions


-- This function will move either the specified or the focuesd
-- window to the requested screen position
function This.moveWindowToPosition(cell, window)
  if window == nil then
    window = hs.window.focusedWindow()
  end
  if window then
    local screen = window:screen()
    hs.grid.set(window, cell, screen)
  end
end

-- This function will move either the specified or the focused
-- window to the center of the sreen and let it fill up the
-- entire screen.
function This.windowMaximize(factor, window)
   if window == nil then
      window = hs.window.focusedWindow()
   end
   if window then
      window:maximize()
   end
end
return This

