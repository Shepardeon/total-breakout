Ball = GameObject:extend()

local function ballFilter(item, other)
    -- La collision avec le joueur est gérée manuellement
    if other.class == "Player" then return "bounce"
    elseif other.class == "Wall" then return "bounce"
    elseif other.class == "Block" then return "bounce"
    end
end

function Ball:new(area, x, y, opts)
    self.super.new(self, area, x, y, opts)

    self.states = {
        attached = self.doAttachedState,
        move = self.doMoveState
    }

    self.w = self.w or 5
    self.color = self.color or Game.defaultColor
    self.state = "attached"
    self.dirX = nil
    self.dirY = nil
    self.maxSpeed = 350
    self.area.world:add(self, self.x, self.y, 2*self.w, 2*self.w)

    Signal.register("launchBall", function ()
        if self.state ~= "move" then
            self.state = "move"
        end
    end)
end

function Ball:update(dt)
    self.super.update(self, dt)
    self.states[self.state](self, dt)
end

function Ball:draw()
    love.graphics.setColor(self.color)
    love.graphics.circle("fill", self.x, self.y, self.w)
    love.graphics.setColor(Game.defaultColor)
end

function Ball:destroy()
    self.super.destroy(self)
    if self.player then self.player = nil end
    self.area.world:remove(self)
end

-- BALL STATES

function Ball:doAttachedState(dt)
    if not self.player then return end

    self.dirX = nil
    self.dirY = nil
    self.x = self.player.x
    self.y = self.player.y - self.w - 5
    self.area.world:update(self, self.x - self.w, self.y - self.w, 2 * self.w, 2 * self.w)
end

function Ball:doMoveState(dt)
    if not self.dirX then
        self.dirX = 0
        self.dirY = -1
    end

    local goalX, goalY = (self.x - self.w) + self.maxSpeed * self.dirX * dt, (self.y - self.w) + self.maxSpeed * self.dirY * dt
    local resX, resY, cols = self.area.world:move(self, goalX, goalY, ballFilter)
    self.x, self.y = resX + self.w, resY + self.w

    if cols[1] then
        if cols[1].other == self.player then
            cols[1].normal.x = -(self.player.x - (cols[1].touch.x + self.w)) / self.player.w
            cols[1].normal.y = -self.dirY
        elseif cols[1].other.class == "Block" then
            cols[1].normal.x = self.dirX
            cols[1].normal.y = -self.dirY
            cols[1].other.dead = true
        elseif cols[1].other.class == "Wall" then
            cols[1].normal.x = -self.dirX
            cols[1].normal.y = self.dirY
        end

        self.dirX = cols[1].normal.x
        self.dirY = cols[1].normal.y
    end
end