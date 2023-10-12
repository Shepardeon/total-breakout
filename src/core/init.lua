shep = shep or {}

-- Util functions
function table.indexOf(table, elem)
    if table == nil or elem == nil then return -1 end

    for i = 1, #table do
        if table[i] == elem then return i end
    end

    return -1
end


-- Required modules
require("src/core/class")
require("src/core/math")
require("src/core/input")
require("src/core/events")
require("src/core/rendering")
require("src/core/scenes")
require("src/core/entities")