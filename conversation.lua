Conversation = Object:extend()

function Conversation:new()
    self.conversation_step = 0
    self.player_portrait = love.graphics.newImage("img/player_portrait.png")
    self.npc_portrait = love.graphics.newImage("img/npc_portrait.png")
    self.player_line = "Is it just me or is it unseasonably nice out today?"
    self.npc_line = "You are correct, it's quite enjoyable weather today"
    self.speech_sound = love.audio.newSource("sounds/speech.wav")
end

function Conversation:draw()
    local w, h = love.graphics.getWidth(), love.graphics.getHeight()
    local top = h - 150
    love.graphics.setColor(150, 150, 150)
    love.graphics.rectangle("fill", 0, top, w, 150)
    love.graphics.setColor(255, 255, 255)
    picture_x, picture_y = 10, love.graphics
    if self.conversation_step < 10 then
        self.speech_sound:play()
        love.graphics.draw(self.player_portrait, 10, top + 10)
        love.graphics.print(self.player_line, 170, top + 20)
    elseif self.conversation_step < 20 then
        self.speech_sound:play()
        love.graphics.draw(self.npc_portrait, 10, top + 10)
        love.graphics.print(self.npc_line, 170, top + 20)

    end
end

function Conversation:update(dt)
    if mode == 'conversation' then
        if love.keyboard.isDown("t") then
            if self.conversation_step > 20 then
                self.conversation_step = 0
                main_theme:stop()
                mode = 'win'
                win_sound:play()
            else
                self.conversation_step = self.conversation_step + 1
            end
        end
    end
end
