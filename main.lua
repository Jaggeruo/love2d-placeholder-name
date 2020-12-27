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
    enemyTiming = 2
    enemySpeed = 100

    enemiesIndex = {}
end

function love.update(dt)
    Background:update(dt)
    Player:update(dt)
    Bullet:update(dt)
    addEnemy(dt)

    for i, opponent in ipairs(enemies) do
        opponent:update(dt)
        enemiesIndex[opponent] = i
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

    for i, opponent in ipairs(enemies) do
        opponent:draw()
    end
end

function addEnemy(dt)
    enemyTimer = enemyTimer + 1 * dt
    if enemyTimer >= enemyTiming then
        table.insert(enemies, Enemy.new(enemySpeed))
        enemyTimer = 0
        math.randomseed(os.time())
        enemyTiming = math.random() + math.random(1, Background.enemySpawn)
    end
end
