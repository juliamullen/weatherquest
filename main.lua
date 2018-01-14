function love.draw()
    if mode == 'adventure' then
        world:draw()
        player:draw()
        mob:draw()
    elseif mode == 'start' or mode == 'instructions' or mode == 'win' then
        screen_manager:draw()
    elseif mode == 'conversation' then
        world:draw()
        player:draw()
        mob:draw()
        screen_manager:draw()
        conversation:draw()
    end
end

function love.load()
    Object = require "classic"

    require "player"
    require "world"
    require "mob"
    require "screen"
    require "conversation"

    init()
end

function init()
    local world_width = 28
    local world_height = 15

    mode = 'start'
    world = World(world_width, world_height)

    local w, h = world.tile_size * world_width, world.tile_size * world_height
    print(w, h)

    love.window.setMode(w, h)
    love.graphics.setDefaultFilter('nearest', 'nearest')

    player = Player()
    mob = Mob()
    screen_manager = ScreenManager(w, h)
    conversation = Conversation()
    load_music()
end

function load_music()
    title_theme = love.audio.newSource("sounds/weather quest title theme.wav")
    main_theme = love.audio.newSource("sounds/weather quest sunny day.wav")
    start = love.audio.newSource("sounds/start.wav")
    win_sound = love.audio.newSource("sounds/win.wav")

    title_theme:setVolume(0.5)
    title_theme:play()
end

function love.update(dt)
    if love.keyboard.isDown("x") or love.keyboard.isDown("q") then
        love.event.quit()
    end
    screen_manager:update(dt)
    if mode == 'adventure' then
        player:update(dt)
    elseif mode == 'conversation' then
        conversation:update(dt)
    end
end
