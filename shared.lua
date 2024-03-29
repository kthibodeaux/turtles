local function dig()
  while turtle.detect() do
    turtle.dig()
  end
end

local function digDown()
  turtle.digDown()
end

local function digUp()
  while turtle.detectUp() do
    turtle.digUp()
  end
end

local function forward(count)
  local count = count or 1

  for i = 1, count, 1 do
    local moved = false

    while not moved do
      if turtle.forward() then
        moved = true
      end
    end
  end
end

local function digAndMoveForward(count, isDigUp, isDigDown)
  local count = count or 1

  for i = 1, count, 1 do
    dig()
    if isDigUp then digUp() end
    if isDigDown then digDown() end
    forward()
  end
end

local function turnAround()
  turtle.turnRight()
  turtle.turnRight()
end

local function digTunnel(depth, isDigUp, isDigDown)
  for i = 1, depth, 1 do
    digAndMoveForward()
    if isDigUp then digUp() end
    if isDigDown then digDown() end
  end
end

local function selectNextSlotWithItem()
  if not (turtle.getItemCount() > 0) then
    turtle.select(turtle.getSelectedSlot() + 1)
  end
end

return {
  dig = dig,
  digAndMoveForward = digAndMoveForward,
  digDown = digDown,
  digTunnel = digTunnel,
  digUp = digUp,
  forward = forward,
  selectNextSlotWithItem = selectNextSlotWithItem,
  turnAround = turnAround
}
