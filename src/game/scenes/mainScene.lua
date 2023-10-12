local MainScene = shep.scenes.baseScene()

local Camera
local Player

function MainScene:init()
    local w, h = love.window.getMode()
    Player = require("src/game/entities/player")
    Camera = shep.rendering.camera(0, 0, w, h, 640, 360)

    Player.pos.x = 300
    Player.pos.y = 345
end

function MainScene:update(dt)
    Player:update(dt)
end

function MainScene:draw()
    Camera:attach()
    Player:draw()
    Camera:detach()
end

return MainScene