local kt = require("shared")

local args = {...}
local tunnels = args[1]
local tunnelDepth = args[2] or 5

for j = 1, tunnels, 1 do
  kt.digTunnel(3, true, true)

  turtle.turnLeft()
  kt.digTunnel(tunnelDepth, true, true)
  kt.turnAround()
  kt.forward(tunnelDepth)

  kt.digTunnel(tunnelDepth, true, true)
  kt.turnAround()
  kt.forward(tunnelDepth)

  turtle.turnRight()
end
