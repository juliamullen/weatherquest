Player = Object:extend()

function Player:new()
    self.image = love.graphics.newImage("img/player1.png")
    self.x = 100
    self.y = 100
    self.speed = 400
end

function Player:get_directions()
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
    return number_directions_pressed, directions_pressed
end

function Player:process_directions(dt, number_directions_pressed, directions_pressed)
    local old_x, old_y, new_x, new_y = self.x, self.y
    if number_directions_pressed == 0 then
        return old_x, old_y
    elseif number_directions_pressed == 1 then
        if directions_pressed["left"] then
            new_x = old_x - dt * self.speed
        elseif directions_pressed["right"] then
            new_x = old_x + dt * self.speed
        elseif directions_pressed["up"] then
            new_y = old_y - dt * self.speed
        elseif directions_pressed["down"] then
            new_y = old_y + dt * self.speed
        end
    elseif number_directions_pressed == 2 then
        -- sine & cosine of 45deg is ~.7
        if directions_pressed["left"] then
            new_x = old_x - dt * self.speed * .7
        end
        if directions_pressed["right"] then
            new_x = old_x + dt * self.speed * .7
        end
        if directions_pressed["up"] then
            new_y = old_y - dt * self.speed * .7
        end
        if directions_pressed["down"] then
            new_y = old_y + dt * self.speed * .7
        end
    end
    return new_x or old_x, new_y or old_y -- this line gives me joy
end

function Player:get_aabb(new_x, new_y)
    local offset_x, offset_y, w, h = 8, 18, 8, 10
    local bound_x, bound_y = new_x + offset_x, new_y + offset_y
    return bound_x, bound_y, w, h
end

function Player:update(dt)
    new_x, new_y = self:process_directions(dt, self:get_directions())
    if new_x ~= self.x or new_y ~= self.y then
        if world:check_collision(self:get_aabb(new_x, new_y)) then
            self.x = new_x
            self.y = new_y
            --print(self.x, self.y)
        end
    end
end

function Player:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, .5, .5)
    --[[if camera:following_player() then
        nil
    else
        love.graphics.draw(self.image, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 0, .5, .5)
    end]]
end
