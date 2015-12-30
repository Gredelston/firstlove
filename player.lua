require('utils')

player = {}
local sx = 1/2

function player.load()
  local spriteDirectory = 'assets/PNG/Players/'
  player.sprites = {
    stand = 'bunny1_stand.png',
    walk1 = 'bunny1_walk1.png',
    walk2 = 'bunny1_walk2.png'
  }

  for sprite, file in pairs(player.sprites) do
    player.sprites[sprite] = loadImage(spriteDirectory..file)
  end

  player.sprite = player.sprites.stand
  player.direction = 0
end

function player.setSprite(spr)
  player.sprite = player.sprites[spr]
end

function player.turnLeft()
  player.direction = -1
  player.setSprite('walk1')
end
function player.turnRight()
  player.direction = 1
  player.setSprite('walk1')
end
function player.stop()
  player.direction = 0
  player.setSprite('stand')
end

function player.draw()
  if player.direction ~= -1 then
    love.graphics.draw(player.sprite, 100, 100, 0, sx)
  else
    local offset = sx * love.graphics.getWidth(player.sprite)
    love.graphics.draw(player.sprite,100,100,0,-1*sx,sx,offset)
  end
end