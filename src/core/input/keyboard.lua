shep.input.keyboard = {}

local keyState = {}

local function HookLoveEvents()
    function love.keypressed(key, scancode, isRepeat)
        keyState[key] = true
    end

    function love.keyreleased(key, scancode)
        keyState[key] = false
    end
end

function shep.input.keyboard.readState()
    for key, _ in pairs(keyState) do
        keyState[key] = nil
    end
end

function shep.input.keyboard.key(key)
    return love.keyboard.isDown(key)
end

function shep.input.keyboard.keyDown(key)
    return keyState[key]
end

function shep.input.keyboard.keyUp(key)
    return keyState[key] == false
end

HookLoveEvents()