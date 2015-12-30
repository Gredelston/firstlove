require('utils')

player = {}
local sx = 2/5

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

  player.setSprite('stand')
  player.direction = 0
  player.x = 100
  player.y = 100
end

function player.setSprite(spr)
  player.sprite = player.sprites[spr]
end

function player.startWalking(key)
  -- key should only ever be 'left' or 'right'.
  if key == 'left' then player.direction = -1 else player.direction = 1 end
  player.walkStartTime = love.timer.getTime()
end
function player.stopWalking()
  player.direction = 0
  player.setSprite('stand')
  player.walkStartTime = nil
end

function player.update(dt)
  player.animateWalk()
end

function player.draw()
  if player.direction ~= -1 then
    love.graphics.draw(player.sprite, player.x, player.y, 0, sx)
  else
    -- I have no idea why this .15 thing happens.
    -- I am wrathful.
    local offset = .15 * love.graphics.getWidth(player.sprite)
    love.graphics.draw(player.sprite,player.x,player.y,0,-1*sx,sx,offset)
  end
end

function player.animateWalk()
  if not player.walkStartTime then return end
  clock = math.floor((player.walkStartTime-love.timer.getTime()) * 5)
  if clock%2==1 then
    player.setSprite('walk1')
  else
    player.setSprite('walk2')
  end
end