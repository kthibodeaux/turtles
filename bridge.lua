local kt = require("shared")

local args = {...}
local distance = tonumber(args[1]) or 0

turtle.forward()

if distance > 0 then
  for i = 1, distance, 1 do
    kt.selectNextSlotWithItem()
    turtle.placeDown()
    turtle.forward()
  end
else
  while not turtle.detectDown() do
    kt.selectNextSlotWithItem()
    turtle.placeDown()
    turtle.forward()
  end
end
