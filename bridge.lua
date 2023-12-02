turtle.forward()

while not turtle.detectDown() do
  if not (turtle.getItemCount() > 0) then
    turtle.select(turtle.getSelectedSlot() + 1)
  end

  turtle.placeDown()
  turtle.forward()
end
