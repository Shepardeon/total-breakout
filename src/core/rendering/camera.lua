shep.rendering.camera = shep.class:derive("Camera")

function shep.rendering.camera:new(x, y, renderWidth, renderHeight, nativeWidth, nativeHeight)
    self.pos = shep.math.vector(x, y)
    self.zoom = 1

    self.renderWidth = renderWidth
    self.renderHeight = renderHeight
    self.nativeWidth = nativeWidth or self.renderWidth
    self.nativeHeight = nativeHeight or self.renderHeight

    self.scaleX = self.renderWidth / self.nativeWidth
    self.scaleY = self.renderHeight / self.nativeHeight
end

function shep.rendering.camera:setPos(x, y)
    self.pos.x = x
    self.pos.y = y
end

function shep.rendering.camera:setZoom(zoom)
    self.zoom = zoom
end

function shep.rendering.camera:attach()
    local scaleX = self.scaleX * self.zoom
    local scaleY = self.scaleY * self.zoom

    love.graphics.push()
    love.graphics.scale(scaleX, scaleY)
    love.graphics.translate(-self.pos.x, -self.pos.y)
end

function shep.rendering.camera:detach()
    love.graphics.pop()
end