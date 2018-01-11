Mob = Object:extend()

function Mob:new()
    self.image = love.graphics.newImage("img/enemy1.png")
    self.x = love.graphics.getWidth() - 100
    self.y = love.graphics.getHeight() - 100
end

function Mob:update(dt)
    if love.keyboard.isDown("t") then
        world:discuss()
    end
end

function Mob:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, .5, .5)
end
