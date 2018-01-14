ScreenManager = Object:extend()

function ScreenManager:new(width, height)
    self.title = love.graphics.newImage("img/title.png")
    self.win = love.graphics.newImage("img/win.png")
    self.instructions = love.graphics.newImage("img/instructions.png")
    self.width = width
    self.height = height
    self.wait_time = 0
end

function ScreenManager:draw()
    if mode == 'start' then
        self:draw_start()
    elseif mode == 'conversation' then
        self:draw_conversation()
    elseif mode == 'instructions' then
        self:draw_instructions()
    elseif mode == 'win' then
        self:draw_win()
    end
end

function ScreenManager:draw_conversation()
end

function ScreenManager:draw_start()
    love.graphics.draw(self.title, 0, 0)
end

function ScreenManager:draw_instructions()
    love.graphics.draw(self.instructions, 0, 0)
end

function ScreenManager:draw_win()
    love.graphics.draw(self.win, 0, 0)
end

function ScreenManager:update(dt)
    if mode == 'instructions' then
        self.wait_time = self.wait_time + dt
        if self.wait_time > 1.5 then
            title_theme:stop()
            main_theme:play()
            mode = 'adventure'
            self.wait_time = 0
        end
    end

    if mode == 'start' and love.keyboard.isDown("p") then
        start:play()
        mode = 'instructions'
    elseif mode == 'win' and love.keyboard.isDown('r') then
        player = Player()
        main_theme:stop()
        title_theme:play()
        mode = 'start'
    elseif mode == 'adventure' or mode == 'conversation' then
        if main_theme:isStopped() then
            main_theme:play()
        end
    end
end
