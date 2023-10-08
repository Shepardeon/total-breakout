shep.math.vector = shep.class:derive("Vector")

local sqrt = math.sqrt

function shep.math.vector:new(x, y)
    self.x = x or 0
    self.y = y or self.x
end

function shep.math.vector:__tostring()
    return "Vector(" .. self.x .. ", " .. self.y .. ")"
end

function shep.math.vector:len()
    return sqrt(self.x*self.x + self.y*self.y)
end

function shep.math.vector:len2()
    return self.x*self.x + self.y*self.y
end

function shep.math.vector:dist(other)
    return sqrt((other.x - self.x) * (other.x - self.x) + (other.y - self.y) * (other.y - self.y))
end

function shep.math.vector:dist2(other)
    return (other.x - self.x) * (other.x - self.x) + (other.y - self.y) * (other.y - self.y)
end

function shep.math.vector:dot(other)
    return self.x * other.x + self.y * other.y
end

function shep.math.vector:normalize()
    local len = self:len()
    self.x = self.x / len
    self.y = self.y / len

    return self
end

function shep.math.vector.__add(a, b)
    return shep.math.vector(a.x + b.x, a.y + b.y)
end

function shep.math.vector.__sub(a, b)
    return a + shep.math.vector(-b.x, -b.y)
end

function shep.math.vector.__mul(a, b)
    if type(a) == number then
        return b * a
    end

    return shep.math.vector(a.x * b, a.y * b)
end

function shep.math.vector.__div(a, b)
    if type(a) == number then
        return b / a
    end

    return shep.math.vector(a.x / b, a.y / b)
end