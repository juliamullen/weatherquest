Mob = Object:extend()

function Mob:new()
    self.image = love.graphics.newImage("img/enemy1.png")
    self.x = love.graphics.getWidth() - 200
    self.y = love.graphics.getHeight() - 200
end

function Mob:in_range(x, y)
    local x_range = x > self.x - 40 and x < self.x + self.image:getWidth() + 20
    local y_range = y > self.y - 50 and y < self.y + self.image:getHeight() + 20
    if x_range and y_range then
        return true
    end
    return false
end

function Mob:check_collision(bound_x, bound_y, w, h)
    local bounding_box = self.x < bound_x + w and
    bound_x < self.x + self.image:getWidth() - 30 and
    self.y < bound_y + h and
    bound_y < self.y + self.image:getHeight() - 15
    print (bounding_box)
    return bounding_box
end

function Mob:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, .5, .5)
end
