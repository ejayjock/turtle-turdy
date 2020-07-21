--[[ Code to be repeated to create a staircase mine
Series of turtle commands:
  - Dig Up
  - Move Up
  - Dig Up
  - Move down
  - dig down
  - move down

  - dig Forward
  - move forward ]]

print("how deep?")
vDeep=tonumber(io.read())

print("What slot is the fill material in?")
nSlot=tonumber(io.read())

function clearUp()
  cont=true
  while cont do
    if turtle.detectUp() then
      turtle.digUp()
    else
      cont=false
    end
  end
end

function clear()
  cont=true
  while cont do
    if turtle.detect() then
      turtle.dig()
    else
      cont=false
    end
  end
end

function FillDown(slot)
  if not turtle.detectDown() then
    turtle.select(slot)
    turtle.placeDown()
  end
end

function FillLeft()
  turtle.turnLeft()
  if not turtle.detect() then
    turtle.placeDown()
    turtle.turnRight()
  end
end

function FillRight()
  turtle.turnRight()
  if not turtle.detect() then
    turtle.placeDown()
    turtle.turnLeft()
  end
end

for i=1,vDeep do
  clearUp()
  turtle.up()
  clearUp()
  turtle.down()
  turtle.digDown()
  turtle.down()
  FillDown(slot)
  FillLeft()
  FillRight()
  clear()
  turtle.forward()
end
