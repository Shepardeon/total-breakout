Block = GameObject:extend()

function Block:new(area, x, y, opts)
    self.super.new(self, area, x, y, opts)

    self.w, self.h = self.w or 40, self.h or 20
    self.color = self.color or Game.defaultColor
    self.area.world:add(self, self.x, self.y, self.w, self.h)
end

function Block:update(dt)
    self.super.update(self, dt)
end

function Block:draw()
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    love.graphics.setColor(Game.defaultColor)
end

function Block:destroy()
    self.super.destroy(self)
    self.area.world:remove(self)
end