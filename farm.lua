local kt = require("shared")

local nextTurnDirection = "right"
local width = 9
local length = 9
local currentColumn = 1

local function currentSlotIsSeed()
  local seedSlot = 16

  return turtle.compareTo(seedSlot)
end

local function selectSeedSlot()
  while not currentSlotIsSeed() do
    if not currentSlotIsSeed() then
      if turtle.getSelectedSlot() < 14 then
        turtle.select(turtle.getSelectedSlot() + 1)
      else
        os.shutdown()
      end
    end
  end
end

local function depositHarvest()
  for i = 1, 14, 1 do
    turtle.select(i)
    turtle.drop()
  end
end

local function moveToNextColumn()
  if not (currentColumn == width) then
    if nextTurnDirection == "left" then
      turtle.turnLeft()
      kt.forward()
      turtle.turnLeft()
      nextTurnDirection = "right"
    else
      turtle.turnRight()
      kt.forward()
      turtle.turnRight()
      nextTurnDirection = "left"
    end
  end

  currentColumn = currentColumn + 1
end

local function workRow()
  for i = 1, length, 1 do
    turtle.digDown()
    selectSeedSlot()
    turtle.placeDown()

    if not (i == length) then
      kt.forward()
    end
  end
end

local function workFarm()
  while (currentColumn <= width) do
    workRow()
    moveToNextColumn()

    if (currentColumn <= width) then
      workRow()
      moveToNextColumn()
    end
  end
end

local function undock()
  while not turtle.detectDown() do
    turtle.down()
  end

  turtle.select(15)
  turtle.digDown()
  turtle.select(1)

  while not turtle.detectDown() do
    turtle.down()
  end

  turtle.up()
  kt.forward()
end

local function dock()
  kt.turnAround()
  kt.forward(9)
  turtle.turnRight()
  kt.forward(8)
  turtle.turnRight()

  while not turtle.detectUp() do
    turtle.up()
  end

  turtle.down()
  turtle.down()
  turtle.select(15)
  turtle.placeDown()
  turtle.select(1)
  turtle.up()
  turtle.up()
end

undock()
workFarm()
dock()
depositHarvest()
os.shutdown()
