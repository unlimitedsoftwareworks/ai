local class = require 'class'
local Scene = class 'Scene'

function Scene:initialize(name)
  self.name = name
  self.children = {}
end

-- Called when the scene was loaded by the engine
function Scene:load()
  print(string.format("Loading scene \'%s\'", self.name))
end

-- Called when the engine closes this scene (generally to load another one)
function Scene:close()
  print(string.format("Closing scene \'%s\'", self.name))
end

-- Updates the scene
function Scene:update(dt)

end

-- The drawing method
function Scene:render()

end

function Scene:addChild(obj)
  table.insert(obj)
end

function Scene:removeChild(obj)
  table.remove(obj)
end

return Scene