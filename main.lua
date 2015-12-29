require('player')

function love.load()
  player.load()
end

function love.keypressed(key)
  if key == 'escape' then love.event.quit() end
end

function love.keyreleased(key)
end

function love.update(dt)
end

function love.draw(dt)
  love.graphics.print("Hello, Greg!", 400, 300)
  love.graphics.draw(player.sprite, 400, 300)
end