require("src/startup")

if arg[#arg] == "vsc_debug" then require("lldebugger").start() end

function love.load()
    local v1 = shep.math.vector(1, 2)
    local v2 = shep.math.vector(3, 4)
end

function love.update(dt)

    -- Updates
    shep.input.keyboard.readState()
end

function love.draw()

end