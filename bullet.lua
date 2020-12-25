Bullet = {}

function Bullet:load()
    self.bulletWidth = 5
    self.bulletHeight = Player.playerHeight * 0.6
    self.bulletX = nil
    self.bulletY = nil
    self.bulletSpeed = 650
    self.bulletReady = true
    self.bulletMoving = false

    self.timer = 0
    self.bulletCooldown = 3
end

function Bullet:update(dt)
    if self.bulletMoving == true then
        self.bulletY = self.bulletY - self.bulletSpeed * dt
        self:topColisionCheck(dt)
    end
end

function Bullet:topColisionCheck(dt)
    if self.bulletY < Background.gameY then
        self.bulletMoving = false
        self.bulletReady = true
        self.bulletX = nil
        self.bulletY = nil

    -- Background.score = Background.score + 1 * Background.combo
    -- Background.combo = Background.combo + 1
    -- Background.combo_cnt = 0
    -- Background.comboTimeReady = true
    end
end

function Bullet:shoot()
    self.bulletReady = false
    self.bulletX = Player.playerX + Player.playerWidth / 2 - self.bulletWidth / 2
    self.bulletY = Player.playerY
    self.bulletMoving = true
end

function Bullet:draw()
    if self.bulletX ~= nil and self.bulletY ~= nil and self.bulletWidth ~= nil and self.bulletHeight ~= nil then
        love.graphics.rectangle("line", self.bulletX, self.bulletY, self.bulletWidth, self.bulletHeight)
    end
end
