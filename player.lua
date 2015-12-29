require('utils')

player = {}
local spriteDirectory = 'assets/PNG/Players/'
player.sprites = {
  stand = 'bunny1_stand.png',
  walk1 = 'bunny1_walk1.png',
  walk2 = 'bunny1_walk2.png'
}

function player.load()
  for sprite, file in pairs(player.sprites) do
    player.sprites[sprite] = loadImage(spriteDirectory..file)
  end
  player.sprite = player.sprites.stand
end