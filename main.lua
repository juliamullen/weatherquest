function love.draw()
    --world:draw(unpack(camera:get_position()))
    world:draw(1, 1, 20, 20)
    player:draw()
end

function love.load()
    Object = require "classic"
    inspect = require "inspect"
    require "player"
    require "world"
    require "camera"
    player = Player()
    world = World()
    camera = Camera(0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    print(0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    love.graphics.setDefaultFilter('nearest', 'nearest')
end

function love.update(dt)
    player:update(dt)
    camera:set_position(player.x, player.y)

    if love.keyboard.isDown("x") or love.keyboard.isDown("q") then
        love.event.quit()
    end
end

--ENEMIES_TRANSPARENT = "#008900"
--CHARACTERS_TRANSPARENT = "#7F00FF"
