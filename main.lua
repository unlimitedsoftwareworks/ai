require 'lovedebug'
local engine = require 'Engine':new()

function love.load()
  engine:load()
end

function love.update(dt)
  engine:update(dt)
end

function love.draw()
  engine:render()
end

function love.exit()
  engine:quit()
end