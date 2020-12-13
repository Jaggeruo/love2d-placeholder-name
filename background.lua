Background = {}

function Background:load()
    self.window_width = love.graphics.getWidth()
    self.window_height = love.graphics.getHeight()
    self.gameX = 10 
    self.gameY = 10
    self.gameWidth = self.window_width - self.gameX * 2
    self.gameHeight = self.window_height / 1.35 - self.gameY * 2

    self.infoX = 10
    self.infoY = self.gameHeight + self.gameY * 2
    self.infoWidth = self.window_width - self.gameX * 2
    self.infoHeight = self.window_height - self.gameHeight - self.gameY * 3
end

function Background:update(dt)
end

function Background:draw()
    love.graphics.rectangle("line", self.gameX, self.gameY, self.gameWidth, self.gameHeight)
    love.graphics.rectangle("line", self.infoX, self.infoY, self.infoWidth, self.infoHeight)
end
