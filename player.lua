Player = Object:extend()

function Player:new()
    self.image = love.graphics.newImage("img/player1.png")
    self.x = 100
    self.y = 100
    self.speed = 400
end

function Player:update(dt)
    local direction_buttons = {
        left = love.keyboard.isDown("left"),
        right = love.keyboard.isDown("right"),
        up = love.keyboard.isDown("up"),
        down=love.keyboard.isDown("down")
    }

    local directions_pressed = {}
    local number_directions_pressed = 0
    for direction,is_pushed in pairs(direction_buttons) do
        if is_pushed then
            number_directions_pressed = number_directions_pressed + 1
            if #directions_pressed < 2 then
                directions_pressed[direction] = is_pushed
            end
        end
    end
    if number_directions_pressed == 0 then
        return
    elseif number_directions_pressed == 1 then
        if directions_pressed["left"] then
            self.x = self.x - dt * self.speed
        elseif directions_pressed["right"] then
            self.x = self.x + dt * self.speed
        elseif directions_pressed["up"] then
            self.y = self.y - dt * self.speed
        elseif directions_pressed["down"] then
            self.y = self.y + dt * self.speed
        end
    elseif number_directions_pressed == 2 then
        -- sine & cosine of 45deg is ~.7
        if directions_pressed["left"] then
            self.x = self.x - dt * self.speed * .7
        end
        if directions_pressed["right"] then
            self.x = self.x + dt * self.speed * .7
        end
        if directions_pressed["up"] then
            self.y = self.y - dt * self.speed * .7
        end
        if directions_pressed["down"] then
            self.y = self.y + dt * self.speed * .7
        end
    end
end

function Player:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, .5, .5)
end
