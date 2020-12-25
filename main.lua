require "background"
require "player"
require "bullet"
require "opponenets"

function love.load()
    Background:load()
    Player:load()
    Bullet:load()

    enemies = {}
    enemyTimer = 0
end

function love.update(dt)
    Background:update(dt)
    Player:update(dt)
    Bullet:update(dt)
    addEnemy(dt)

    for i, v in ipairs(enemies) do
        v:update(dt)
    end
end

function love.keypressed(key)
    if key == "space" and Bullet.bulletReady == true then
        Bullet:shoot()
    end
end

function love.draw()
    Background:draw()
    Player:draw()
    Bullet:draw()

    for i, v in ipairs(enemies) do
        love.graphics.rectangle("line", v.x, v.y, v.width, v.height)
    end
end

function addEnemy(dt)
    enemyTimer = enemyTimer + 1 * dt
    if enemyTimer >= 3 then
        table.insert(enemies, Enemy.new(enemyIndex))
        enemyTimer = 0
    end
end
