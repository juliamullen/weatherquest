Camera = Object:extend()

function Camera:new()
end

function Camera:draw(x, y, width, height)
    for row,row_data in ipairs(self.map) do
        for column,image in ipairs(row_data) do
            love.graphics.draw(self.tiles[image], 48*(column - 1), 48*(row - 1))
        end
    end
end
