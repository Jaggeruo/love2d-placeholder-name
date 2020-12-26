Enemy = {}

function Enemy.new(speed)
    local self = {}

    self.x = 25
    self.y = 25
    self.width = 20
    self.height = 20

    self.moveDown = 50

    self.horizontalSpeed = speed

    function self:update(dt)
        self.x = self.x + self.horizontalSpeed * dt
        self:colisionCheck()
    end

    function self:draw()
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
    end

    function self:colisionCheck()
        if self.x + self.width >= Background.gameX + Background.gameWidth - 5 then
            self.x = self.x - 1
            self.y = self.y + self.moveDown
            self.horizontalSpeed = -self.horizontalSpeed
        elseif self.x <= Background.gameX + 5 then
            self.x = self.x + 1
            self.y = self.y + self.moveDown
            self.horizontalSpeed = -self.horizontalSpeed
        elseif Bullet:bulletCheck() then
            if self:enemyBulletCollision() then
                Bullet:bulletEnd()
                table.remove(enemies, enemiesIndex[self])
                Background:scoreCombo()
                Bullet.bulletSpeed = Bullet.startBulletSpeed + Bullet.startBulletSpeed * (Background.combo * 0.035)
            end
        elseif self.y + self.height >= Background.endLineY then
            love.event.quit()
        end
    end

    function self:enemyBulletCollision()
        if
            self.x < Bullet.bulletX + Bullet.bulletWidth and self.x + self.width > Bullet.bulletX and
                self.y < Bullet.bulletY + Bullet.bulletHeight and
                self.y + self.height > Bullet.bulletY
         then
            return true
        end
    end

    return self
end

return Enemy
