World = Object:extend()

local utils = require "utils"

function World:new(width, height)
    self.map_width = width
    self.map_height = height
    self.map = utils.create_map(self.map_width, self.map_height)
    self.tiles = {love.graphics.newImage("img/tile1.png"), love.graphics.newImage("img/tile2.png"), love.graphics.newImage("img/wall.png")}
    self.tile_size = 48
end

function World:draw()
    local top, bottom, left, right = 1, self.map_height, 1, self.map_width
    for row_index = left, right do
        for column_index = top, bottom do
            local image_index = self.map[column_index] and self.map[column_index][row_index]
            local image = self.tiles[image_index]

            if image then

                --print(row_index, column_index)
                --print(image_index, image)

                -- löve subtracting ones from stuff
                -- don't +1 this code, because
                -- this is the real deal -1 code
                love.graphics.draw(image, self.tile_size * (row_index - 1), self.tile_size * (column_index - 1))

            end
        end
    end
end


function World:get_tile_coordinates(x, y, w, h)
    --print(x, y, w, h)
    local top, bottom = math.ceil(y / self.tile_size),  math.ceil((y + h) / self.tile_size)
    local left, right = math.ceil(x / self.tile_size), math.ceil((x + w) / self.tile_size)
    --print("top", top, "bottom", bottom, "left", left, "right", right)

    return top, bottom, left, right
end

function World:check_collision(bound_x, bound_y, w, h)
    local top, bottom, left, right = self:get_tile_coordinates(bound_x, bound_y, w, h)
    --print("top", top, "bottom", bottom, "left", left, "right", right)
    for column_index = top, bottom do
        for row_index = left, right do
            local tile = self.map[column_index] and self.map[column_index][row_index]
            --print("column", column_index, "row", row_index, "tile", tile)
            if not tile or tile == 3 then
                --print ("left", left, "right", right, "top", top, "bottom", bottom)
                return true
            end
        end
    end
    --print ("left", left, "right", right, "top", top, "bottom", bottom)
    --print(self.map[top][left], self.map[bottom][right])
    return false
end
