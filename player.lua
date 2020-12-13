Player = {}

function Player:load()
    self.playerWidth = 25
    self.playerHeight = 25
    self.playerX = love.graphics.getWidth() / 2 - self.playerWidth / 2
    self.playerY = Background.gameY + Background.gameHeight - self.playerHeight - 5
    self.playerSpeed = 450
end

function Player:update(dt)
    Player:movement(dt)
end

function Player:movement(dt)
    if love.keyboard.isDown("a") then
        if self.playerX < Background.gameX + 2 + 5 then
            self.playerX = Background.gameX + 5
        else
            self.playerX = self.playerX - self.playerSpeed * dt
        end
    end
    if love.keyboard.isDown("d") then
        if self.playerX + self.playerWidth > Background.gameWidth + Background.gameX - 2 - 5 then
            self.playerX = Background.gameWidth + Background.gameX - self.playerWidth - 5
        else
            self.playerX = self.playerX + self.playerSpeed * dt
        end
    end
end

function Player:draw()
    love.graphics.rectangle("fill", self.playerX, self.playerY, self.playerWidth, self.playerHeight)
end
