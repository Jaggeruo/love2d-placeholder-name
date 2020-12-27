Enemy = {}

function Enemy.new(speed)
    local self = {}

    self.x = 25
    self.y = 25
    self.width = 20
    self.height = 20

    self.moveDown = 50

    self.horizontalSpeed = speed

    self.bulletX = nil
    self.bulletY = nil
    self.bulletWidth = 4
    self.bulletHeight = self.height * 0.5
    self.bulletSpeed = 350

    self.bulletCooldown = 5
    self.bulletTimer = 0

    self.bulletReady = true
    self.bulletMoving = false

    function self:update(dt)
        self.x = self.x + self.horizontalSpeed * dt
        self:colisionCheck()

        if
            self.x + self.width / 2 >= Player.playerX + Player.playerWidth / 2 - 5 and
                self.x + self.width / 2 <= Player.playerX + Player.playerWidth / 2 + 5 and
                self.bulletReady == true
         then
            self:shoot(dt)
        elseif self.bulletMoving == true then
            self.bulletY = self.bulletY + self.bulletSpeed * dt
            self:bulletColisionCheck()
        end
    end

    function self:draw()
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("line", self.x, self.y, self.width, self.height)

        if self.bulletMoving == true and self.x ~= nil and self.y ~= nil then
            love.graphics.rectangle("line", self.bulletX, self.bulletY, self.bulletWidth, self.bulletHeight)
        end
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
                Bullet.bulletSpeed = Bullet.startBulletSpeed + Bullet.startBulletSpeed * (Background.combo * 0.03)
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

    function self:shoot(dt)
        self.bulletReady = false
        self.bulletMoving = true
        self.bulletX = self.x + self.width / 2 - self.bulletWidth / 2
        self.bulletY = self.y
    end

    function self:bulletColisionCheck()
        if self.bulletY + self.bulletHeight >= Background.gameY + Background.gameHeight then
            self.bulletMoving = false
            self.bulletReady = true
            self.bulletX = nil
            self.bulletY = nil
        elseif
            self.bulletX < Player.playerX + Player.playerWidth and self.bulletX + self.bulletWidth > Player.playerX and
                self.bulletY < Player.playerY + Player.playerHeight and
                self.bulletY + self.bulletHeight > Player.playerY
         then
            love.event.quit()
        end
    end

    return self
end

return Enemy
