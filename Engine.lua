local class = require 'class'
local Engine = class 'Engine'

-- When the engine was first constructed
function Engine:initialize()
	print("starting game engine ..")
end

function Engine:load()
	self.scene = nil
	self.zoom = 1
	self.rot = 0

	self.width = love.graphics.getWidth()
	self.height = love.graphics.getHeight()
	print(string.format("Resolution: %dx%d", self.width, self.height))

	print("Loading initial scene")
	self.scene = require 'scenes.IntroScene':new()
	self.scene:load()
	print("Engine loading complete")
end

function Engine:loadScene(scene)
	self.scene:close()
	self.scene = scene
	self.scene:load()
end

function Engine:update(dt)
	self.scene:update(dt)
end

function Engine:render()
  love.graphics.push()
	self.scene:render()
	love.graphics.pop()
end

function Engine:onEvent(evt)
	self.scene:propagateEvent(evt)
end

function Engine:quit()
	print("shutting down engine ..")
end

function Engine:resize()
	self.width = love.graphics.getWidth()
	self.height = love.graphics.getHeight()
	print(string.format"Updated resolution: %nx%n", self.width, self.height)
end

return Engine