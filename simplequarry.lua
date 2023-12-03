local kt = require("shared")

local args = {...}
local width = tonumber(args[1])
local length = tonumber(args[2]) - 1
local depth = tonumber(args[3])
local direction = args[4] or "left"

print("width, length, depth, direction = left")
print("place turtle on the right corner")

currentColumn = 1

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

  turtle.digDown()
  turtle.down()

  while (currentColumn <= width) do
    digColumn()

    if (currentColumn <= width) then
      digColumn()
    end
  end

  turtle.down()
  kt.turnAround()
end
