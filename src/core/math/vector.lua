shep.math.vector = shep.class:derive("Vector")

function shep.math.vector:new(x, y)
    self.x = x or 0
    self.y = y or x
end

function shep.math.vector:__tostring()
    return "Vector(" .. self.x .. ", " .. self.y .. ")"
end
