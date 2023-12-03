print("width, length, depth, direction = left, upordown = down")

local kt = require("shared")

local args = {...}
local width = tonumber(args[1])
local length = tonumber(args[2]) - 1
local depth = tonumber(args[3])
local direction = args[4] or "left"
local upordown = args[5] or "down"

currentColumn = 1

local function changeElevation(isDig)
  if upordown == "down" then
    if isDig then turtle.digDown() end
    turtle.down()
  else
    if isDig then turtle.digUp() end
    turtle.up()
  end
end

local function digColumn()
  kt.digTunnel(length, false, false)

  if not (currentColumn == width) then
    if direction == "left" then
      turtle.turnLeft()
      kt.digAndMoveForward()
      turtle.turnLeft()
      direction = "right"
    else
      turtle.turnRight()
      kt.digAndMoveForward()
      turtle.turnRight()
      direction = "left"
    end
  end

  currentColumn = currentColumn + 1
end

for currentDepth = 1, depth, 1 do
  currentColumn = 1

  changeElevation(true)

  while (currentColumn <= width) do
    digColumn()

    if (currentColumn <= width) then
      digColumn()
    end
  end

  changeElevation()
  kt.turnAround()
end
