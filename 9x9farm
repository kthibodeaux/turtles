-- before running make sure slot 16 of the turtle has a single seed of what you are replanting
-- place on the same level as the FARMLAND in the bottom left corner
-- W is water source
-- T is turtle
-- _ is crop
-- |_|_|_|_|_|_|_|_|_|
-- |_|_|_|_|_|_|_|_|_|
-- |_|_|_|_|_|_|_|_|_|
-- |_|_|_|_|_|_|_|_|_|
-- |_|_|_|_|W|_|_|_|_|
-- |_|_|_|_|_|_|_|_|_|
-- |_|_|_|_|_|_|_|_|_|
-- |_|_|_|_|_|_|_|_|_|
-- |_|_|_|_|_|_|_|_|_|
-- |T|.|.|.|.|.|.|.|.|

currentslot = 1
keepplanting = true

turtle.select(1)

function farmrow()
  for x = 1, 8, 1 do
    turtle.digDown()
    turtle.forward()
  end
  turtle.digDown()
end

function farmspecialrow()
  for x = 1, 4, 1 do
    turtle.digDown()
    turtle.forward()
  end
  turtle.forward()
  for x = 1, 3, 1 do
    turtle.digDown()
    turtle.forward()
  end
  turtle.digDown()
end

function plantseed()
  if comparetoseed() == false then
    nextslot()
  end
  if turtle.getItemCount(currentslot) == 0 then
    nextslot()
  end
  if keepplanting then
    turtle.placeDown()
  end
end

function plantrow()
  for x = 1, 8, 1 do
    plantseed()
    turtle.forward()
  end
  plantseed()
end

function moveleft()
  turtle.turnLeft()
  turtle.forward()
  turtle.turnLeft()
end

function moveright()
  turtle.turnRight()
  turtle.forward()
  turtle.turnRight()
end

function comparetoseed()
  return turtle.compareTo(16)
end

function nextslot()
  if currentslot < 15 then
    currentslot = currentslot + 1
    turtle.select(currentslot)
    if comparetoseed() == false then
      nextslot()
    end
  else
    keepplanting = false
  end
end

turtle.up()
turtle.up()
turtle.forward()

farmrow()
moveright()
farmrow()
moveleft()
farmrow()
moveright()
farmrow()
moveleft()

farmspecialrow()
moveright()

farmrow()
moveleft()
farmrow()
moveright()
farmrow()
moveleft()
farmrow()

turtle.turnLeft()
turtle.turnLeft()

plantrow()
moveright()
plantrow()
moveleft()
plantrow()
moveright()
plantrow()
moveleft()
plantrow()
moveright()
plantrow()
moveleft()
plantrow()
moveright()
plantrow()
moveleft()
plantrow()

turtle.forward()
turtle.turnLeft()
turtle.turnLeft()
turtle.down()
turtle.down()
