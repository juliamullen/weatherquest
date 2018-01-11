function love.draw()
    world:draw()
    player:draw()
end

function love.load()
    local world_width = 30
    local world_height = 16
    Object = require "classic"
    inspect = require "inspect"
    require "player"
    require "world"
    player = Player()
    world = World(world_width, world_height)
    love.window.setMode(world.tile_size * world_width, world.tile_size * world_height)
    love.graphics.setDefaultFilter('nearest', 'nearest')
end

function love.update(dt)
    player:update(dt)

    if love.keyboard.isDown("x") or love.keyboard.isDown("q") then
        love.event.quit()
    end
end

--ENEMIES_TRANSPARENT = "#008900"
--CHARACTERS_TRANSPARENT = "#7F00FF"
