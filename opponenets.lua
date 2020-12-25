Enemy = {}

function Enemy.new(index)
    local self = {}

    self.x = 50
    self.y = 50
    self.width = 10
    self.height = 10
    self.speed = 100

    function self:update(dt)
        self.x = self.x + self.speed * dt
        self:colisionCheck()
    end

    function self:colisionCheck()
        if self.x >= Background.gameX + Background.gameWidth then
        -- pass
        end
    end

    return self
end

return Enemy
