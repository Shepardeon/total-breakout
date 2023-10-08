require("src/startup")

if arg[#arg] == "vsc_debug" then require("lldebugger").start() end

function love.load()
    local v1 = shep.math.vector(1, 2)
    local v2 = shep.math.vector(3, 4)
    print(v1, v2)
end

function love.update(dt)

end

function love.draw()

end