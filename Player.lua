require('utils')

Player = {}
local scale = 2/5

function Player:new(params)
  setmetatable(params, self)
  self.__index = self

  -- load up those sprites
  Player.sprites = {
    stand = 'bunny1_stand.png',
    walk1 = 'bunny1_walk1.png',
    walk2 = 'bunny1_walk2.png'
  }
  local spriteDirectory = 'assets/PNG/Players/'
  for sprite, file in pairs(Player.sprites) do
    Player.sprites[sprite] = loadImage(spriteDirectory..file)
  end

  -- initialize those attributes
  self:setSprite('stand')
  self.direction = 0
  self.x = params.x
  self.y = params.y
  self.walkStartTime = nil
  return params
end

function Player:setSprite(spr)
  self.sprite = Player.sprites[spr]
end

function Player:startWalking(key)
  -- key should only ever be 'left' or 'right'.
  if key == 'left' then self.direction = -1 else self.direction = 1 end
  self.walkStartTime = love.timer.getTime()
end

function Player:stopWalking()
  self.direction = 0
  self:setSprite('stand')
  self.walkStartTime = nil
end


function Player:update(dt)
  self:animateWalk()
end

function Player:draw()
  if self.direction ~= -1 then
    love.graphics.draw(self.sprite, self.x, self.y, 0, scale)
  else
    -- I have no idea why this .15 thing happens.
    -- I am wrathful.
    local offset = .15 * love.graphics.getWidth(self.sprite)
    love.graphics.draw(self.sprite, self.x, self.y, 0, -1*scale, scale, offset)
  end
end

function Player:animateWalk()
  if not self.walkStartTime then return end
  clock = math.floor((self.walkStartTime-love.timer.getTime()) * 5)
  if clock%2==1 then
    self:setSprite('walk1')
  else
    self:setSprite('walk2')
  end
end