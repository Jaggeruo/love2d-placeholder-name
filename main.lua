require "background"
require "player"
require "bullet"

function love.load()
    Background:load()
    Player:load()
    Bullet:load()
end

function love.update(dt)
    Background:update(dt)
    Player:update(dt)
    Bullet:update(dt)
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
end
