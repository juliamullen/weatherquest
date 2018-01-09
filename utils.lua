local utils = {}

function utils.create_map(width, height)
    -- creates a map!
    math.randomseed(2)
    local map = {}
    for i=1,height do
        local map_row = {}
        for j=1,width do
            if i == 1 or j == 1 or i == height or j == width then
                map_row[j] = 3
            else
                map_row[j] = math.random(1, 2)
            end
        end
        map[i] = map_row
    end
    --print(inspect(map))
    map[8][11] = 3
    return map
end

return utils
