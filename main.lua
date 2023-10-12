require("src/startup")

if arg[#arg] == "vsc_debug" then require("lldebugger").start() end

-- Engine imports
local SceneManager = shep.scenes.sceneManager
local Keyboard = shep.input.keyboard

-- Game imports
local MainScene = require("src/game/scenes/mainScene")

function love.load()
    local v1 = shep.math.vector(1, 2)
    local v2 = shep.math.vector(3, 4)

    SceneManager:switchScene(MainScene)
end

function love.update(dt)
    -- Updates
    SceneManager:update(dt)
    Keyboard.readState()
end

function love.draw()
    SceneManager:draw()
end