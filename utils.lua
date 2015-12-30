function loadImage(file)
  return love.graphics.newImage(file)
end

function inList(elem, arr)
  for _, l in ipairs(arr) do
    if l == elem then return true end
  end
  return false
end