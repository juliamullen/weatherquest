Camera = Object:extend()

function Camera:new(x, y, width, height)
    self:set_position(x, y)
    self.width, self.height = width, height
    return
end

function Camera:set_position(x, y)
    x = x > 0 and x or 0
    y = y > 0 and y or 0
    self.x, self.y = x, y
    return
end

function Camera:get_position()
    return {self.x, self.y, self.width, self.height}
end
