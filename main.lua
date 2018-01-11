function love.draw()
    if mode == 'adventure' then
        world:draw()
        player:draw()
        mob:draw()
    end
end

function love.load()
    Object = require "classic"
    inspect = require "inspect"

    require "player"
    require "world"
    require "mob"

    local world_width = 13
    local world_height = 12

    mode = 'adventure'
    world = World(world_width, world_height)
    love.window.setMode(world.tile_size * world_width, world.tile_size * world_height)
    love.graphics.setDefaultFilter('nearest', 'nearest')

    player = Player()
    mob = Mob()
end

function love.update(dt)
    if love.keyboard.isDown("x") or love.keyboard.isDown("q") then
        love.event.quit()
    end
    if mode == 'adventure' then
        player:update(dt)
    elseif mode == 'start' then
    elseif mode == 'conversation' then
    elseif mode == 'end' then
    end

end
