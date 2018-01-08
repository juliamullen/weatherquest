function love.draw()
    love.graphics.print("Hello World", 10, 10)
    world:draw(1, 1, 20, 20)
    player:draw()
end

function love.load()
    Object = require "classic"
    inspect = require "inspect"
    require "player"
    require "world"
    player = Player()
    world = World()
    love.graphics.setDefaultFilter('nearest', 'nearest')
end

function love.update(dt)
    player:update(dt)

    if love.keyboard.isDown("x") then
        love.event.quit()
    end
end

--ENEMIES_TRANSPARENT = "#008900"
--CHARACTERS_TRANSPARENT = "#7F00FF"
