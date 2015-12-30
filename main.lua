require('player')

function love.load()
  player.load()
end

function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  elseif key == 'left' then
    player.turnLeft()
  elseif key == 'right' then
    player.turnRight()
  end
end

function love.keyreleased(key)
  if key == 'left' or key == 'right' then
    player.stop()
  end
end

function love.update(dt)
  player.update(dt)
end

function love.draw(dt)
  player.draw()
end