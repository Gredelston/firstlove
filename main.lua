require('./player')

function love.load()
end

function love.keypressed(key)
  if key == 'escape' then love.event.quit() end
end

function love.keyreleased(key)
end

function love.update(dt)
end

function love.draw(dt)
  love.graphics.print(
    "Hello, " .. player.name .. "!",
    400, 300
  )
end