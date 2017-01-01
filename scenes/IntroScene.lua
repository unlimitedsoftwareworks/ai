local class = require 'class'
local Scene = require 'Scene'

local IntroScene = class('IntroScene', Scene)

function IntroScene:initialize()
  Scene.initialize(self, "IntroScene")
  self.timer = require 'engine.Timer':new(5000)
  self.font = love.graphics.newFont("assets/fonts/ki_kokugo/font_1_kokugl_1.00_rls.ttf", 200)
  self.font2 = love.graphics.newFont('assets/fonts/exo/Exo-Light.otf', 40)
  
  self.logoDrawX = self.font:getWidth("愛") / 2 
  self.logoDrawY = self.font:getHeight() / 2 + self.font2:getHeight()/2
  self.logoDrawX2 = self.font2:getWidth("Game Engine") / 2
  self.logoDrawY2 = self.font2:getHeight() / 2 - self.font:getHeight()/2
end

function IntroScene:load()
  Scene.load(self)
  self.timer:start()
end

function IntroScene:close()
  Scene.close(self)
end

function IntroScene:update(dt)
  self.timer:update(dt)  
end

function IntroScene:render()
  --if self.timer.active then
    local midx, midy = love.graphics.getWidth()/2, love.graphics.getHeight()/2
    love.graphics.setBackgroundColor(255, 255, 255)
    love.graphics.setColor(255, 255, 255)
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(self.font)
    love.graphics.print("愛", midx, midy, 0, 1, 1, self.logoDrawX, self.logoDrawY)
    love.graphics.setFont(self.font2)
    love.graphics.print("Game Engine", midx, midy, 0, 1, 1, self.logoDrawX2, self.logoDrawY2)
    
  --else
  --  love.graphics.print("By praisethemoon", 100, 100)
  --end  
end

return IntroScene