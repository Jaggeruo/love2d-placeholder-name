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

    self.score = 0
    self.time = 0

    self.cnt = 0

    self.combo = 1
    self.combo_cnt = 0
    self.comboTimeReady = false

    self.endLineY = self.gameHeight - 100

    self.enemySpawn = 5

    self.font = love.graphics.newFont(45)
end

function Background:update(dt)
    Background:gameTime(dt)
    Background:comboTime(dt)
end

function Background:draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("line", self.gameX, self.gameY, self.gameWidth, self.gameHeight)
    love.graphics.rectangle("line", self.infoX, self.infoY, self.infoWidth, self.infoHeight)

    love.graphics.setFont(self.font)

    love.graphics.print("Score: " .. self.score, self.gameX + 5, self.infoY + 10)
    love.graphics.print("Time: " .. self.time, self.gameX + 5, self.infoY + 80)
    love.graphics.print("Combo: x" .. self.combo, love.graphics.getWidth() / 2 - 15, self.infoY + 10)
    love.graphics.print(
        "Combo time: " .. math.floor(10 - self.combo_cnt),
        love.graphics.getWidth() / 2 - 15,
        self.infoY + 80
    )

    love.graphics.setColor(0, 1, 0)
    love.graphics.line(self.gameX, self.endLineY, self.gameX + self.gameWidth, self.endLineY)
end

function Background:gameTime(dt)
    self.cnt = self.cnt + 1 * dt
    if self.cnt >= 1 then
        self.time = self.time + 1
        self.cnt = 0

        if self.time % 15 == 0 and self.enemySpawn > 1 then
            self.enemySpawn = self.enemySpawn - 0.5
            enemySpeed = enemySpeed + 30
        end
    end
end

function Background:comboTime(dt)
    if self.comboTimeReady == true then
        self.combo_cnt = self.combo_cnt + 1 * dt

        if self.combo_cnt >= 10 then
            self.combo = 1
            self.comboTimeReady = false
            self.combo_cnt = 0
        end
    end
end

function Background:scoreCombo()
    self.score = self.score + 1 * self.combo
    if self.combo < 10 then
        self.combo = self.combo + 1
    end
    self.combo_cnt = 0
    self.comboTimeReady = true
end
