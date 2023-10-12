local Vector = shep.math.vector

shep.ent.gameObject = shep.class:derive("GameObject")

function shep.ent.gameObject:new(pos)
    self.pos = pos or Vector(0, 0)
end