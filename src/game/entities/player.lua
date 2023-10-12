local Player = shep.ent.gameObject:derive("Player")

local PLAYER_HEIGHT = 10
Player.width  = 70
Player.speed  = 250

function Player:update(dt)
    if shep.input.keyboard.key('d') then
        self.pos.x = self.pos.x + self.speed * dt
    elseif shep.input.keyboard.key('q') then
        self.pos.x = self.pos.x - self.speed * dt
    end
end

function Player:draw()
    love.graphics.rectangle("fill", self.pos.x - Player.width / 2, self.pos.y, Player.width, PLAYER_HEIGHT)
end

return Player()