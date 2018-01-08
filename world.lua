World = Object:extend()

function create_map(width, height)
    math.randomseed(2)
    local map = {}
    for i=1,height do
        local map_row = {}
        for j=1,width do
            map_row[j] = math.random(1, 3)
        end
        map[i] = map_row
    end
    --print(inspect(map))
    return map
end

function World:new()
    self.map = create_map(20, 20)
    self.tiles = {love.graphics.newImage("img/grass-tile.png"), love.graphics.newImage("img/grass-tile-2.png"), love.graphics.newImage("img/grass-tile-3.png")}
    self.tile_size = 48
end

function World:draw(x, y, width, height)
    -- löve subtracting ones from stuff
    -- don't +1 this code, because
    -- this is the real deal -1 code
    for row_index = x, x + width - 1 do
        for column_index = y, y + height - 1 do
            local image_index = self.map[column_index][row_index]
            local image = self.tiles[image_index]
            love.graphics.draw(image, self.tile_size * (column_index - 1), self.tile_size * (row_index - 1))
        end
    end
end
