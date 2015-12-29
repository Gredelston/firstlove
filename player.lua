require('utils')

player = {}
player.sprites = {
  ready = 'assets/PNG/Players/bunny1_ready.png'
}

function player.load()
  for sprite, file in pairs(player.sprites) do
    player.sprites[sprite] = loadImage(file)
  end
end