
local GRID_WIDTH = 800
local GRID_HEIGHT = 600

local player1 = {
    x = 30,
    y = 250,
    width = 15,
    height = 100,
    speed = 300
}

local player2 = {
    x = 755,
    y = 250,
    width = 15,
    height = 100,
    speed = 300
}

function love.load()
    love.window.setMode(GRID_WIDTH, GRID_HEIGHT)
    love.window.setTitle("Pong Assignment")
    love.graphics.setBackgroundColor(0, 0, 0)
end

function love.update(dt)
    -- Player 1 movement
    if love.keyboard.isDown("w") then
        player1.y = player1.y - player1.speed * dt
    end

    if love.keyboard.isDown("s") then
        player1.y = player1.y + player1.speed * dt
    end

    -- Player 2 movement
    if love.keyboard.isDown("up") then
        player2.y = player2.y - player2.speed * dt
    end

    if love.keyboard.isDown("down") then
        player2.y = player2.y + player2.speed * dt
    end

    -- Keep Player 1 inside the screen
    if player1.y < 0 then
        player1.y = 0
    end

    if player1.y + player1.height > GRID_HEIGHT then
        player1.y = GRID_HEIGHT - player1.height
    end

    -- Keep Player 2 inside the screen
    if player2.y < 0 then
        player2.y = 0
    end

    if player2.y + player2.height > GRID_HEIGHT then
        player2.y = GRID_HEIGHT - player2.height
    end
end

function love.draw()
    love.graphics.setColor(1, 1, 1)

    love.graphics.rectangle(
        "fill",
        player1.x,
        player1.y,
        player1.width,
        player1.height
    )

    love.graphics.rectangle(
        "fill",
        player2.x,
        player2.y,
        player2.width,
        player2.height
    )
end
