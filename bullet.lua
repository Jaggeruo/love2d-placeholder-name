Bullet = {}

function Bullet:load()
    self.bulletWidth = 5
    self.bulletHeight = Player.playerHeight * 0.6
    self.bulletX = nil
    self.bulletY = nil
    self.startBulletSpeed = 650
    self.bulletSpeed = self.startBulletSpeed
    self.bulletReady = true
    self.bulletMoving = false
end

function Bullet:update(dt)
    if self.bulletMoving == true then
        self.bulletY = self.bulletY - self.bulletSpeed * dt
        self:topColisionCheck()
    end
end

function Bullet:topColisionCheck()
    if self.bulletY < Background.gameY then
        Bullet:bulletEnd()
    end
end

function Bullet:shoot()
    self.bulletReady = false
    self.bulletX = Player.playerX + Player.playerWidth / 2 - self.bulletWidth / 2
    self.bulletY = Player.playerY
    self.bulletMoving = true
end

function Bullet:draw()
    if Bullet:bulletCheck() then
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("line", self.bulletX, self.bulletY, self.bulletWidth, self.bulletHeight)
    end
end

function Bullet:bulletCheck()
    if self.bulletX ~= nil and self.bulletY ~= nil then
        return true
    end
end

function Bullet:bulletEnd()
    self.bulletMoving = false
    self.bulletReady = true
    self.bulletX = nil
    self.bulletY = nil
end
