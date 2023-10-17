Stage = Object:extend()

local function loadLevel(area)
    -- Add walls
    area:addGameObject("Wall", 0, 0, { w = 25, h = Game.h })
    area:addGameObject("Wall", 0, 0, { w = Game.w, h = 25 })
    area:addGameObject("Wall", Game.w - 25, 0, { w = 25, h = Game.h })

    for x = 1, Game.w/50 do 
        for y = 1, Game.h/70 do
            area:addGameObject("Block", 25 + 45 * x, 25 + 25 * y, { w = 35, h = 10, color = { Random(), Random(), Random() } })
        end
    end
end

function Stage:new()
    self.area = Area(self)
    self.area:addPhysicsWorld()
    self.mainCanvas = love.graphics.newCanvas(Game.w, Game.h)

    loadLevel(self.area)
    self.player = self.area:addGameObject("Player", Game.w/2, Game.h - 25)
    self.area:addGameObject("Ball", 0, 0, { player = self.player })
end

function Stage:update(dt)
    GameCamera.smoother = Camera.smooth.damped(5)
    GameCamera:lockPosition(dt, Game.w/2, Game.h/2)

    self.area:update(dt)
end

function Stage:draw()
    love.graphics.setCanvas(self.mainCanvas)
    love.graphics.clear()
        GameCamera:attach(0, 0, Game.w, Game.h)
        self.area:draw()
        GameCamera:detach()
    love.graphics.setCanvas()

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setBlendMode("alpha", "premultiplied")
    love.graphics.draw(self.mainCanvas, 0, 0, 0, Game.sX, Game.sY)
    love.graphics.setBlendMode("alpha")
end

function Stage:destroy()
    self.area:destroy()
    self.area = nil
    self.player = nil
end