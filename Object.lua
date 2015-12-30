Object = {}

Object.sprites = {
  default = love.graphics.newImage('assets/PNG/Items/bubble.png')
}

function Object:new(newObject)
  setmetatable(newObject, self) -- "self" here refers to the Player prototype
  self.__index = self
  self.scale = 1/2
  return newObject
end

function Object:setSprite(spr)
  self.sprite = self.__index.sprites[spr]
end

function Object:draw()
  love.graphics.draw(self.sprite, self.x, self.y, 0, self.scale)
end