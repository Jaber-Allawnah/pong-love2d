
local GRID_WIDTH = 800
local GRID_HEIGHT = 600
local PADDLE_WIDTH = 15
local PADDLE_HEIGHT = 100
local PADLE_SPEED = 300

local player1_score = 0
local player2_score = 0

local gameState = "menu"

local player1 = {
    x = 30,
    y = 250
}
local player2 = {
    x = 755,
    y = 250
}

local ball = {
    x = GRID_WIDTH / 2,
    y = GRID_HEIGHT / 2,
    radius = 10,
    dx = 200,
    dy = 150
}

local scoreFont

local function resetBall(dx)
    ball.x = GRID_WIDTH / 2
    ball.y = GRID_HEIGHT / 2
    ball.dx = dx
    ball.dy = 150
end

function love.load()
    love.window.setMode(GRID_WIDTH, GRID_HEIGHT)
    love.window.setTitle("Pong Assignment")
    love.graphics.setBackgroundColor(0, 0, 0)
    scoreFont = love.graphics.newFont(32)
end

function love.update(dt)
    if gameState ~= "play" then
        return
    end

    -- Player movement
    if love.keyboard.isDown("w") then
        player1.y = player1.y - PADLE_SPEED * dt
    end

    if love.keyboard.isDown("s") then
        player1.y = player1.y + PADLE_SPEED * dt
    end

    if love.keyboard.isDown("up") then
        player2.y = player2.y - PADLE_SPEED * dt
    end

    if love.keyboard.isDown("down") then
        player2.y = player2.y + PADLE_SPEED * dt
    end

    -- Ball movement
    ball.x = ball.x + ball.dx * dt
    ball.y = ball.y + ball.dy * dt

    -- Ball wall collision
    if ball.y + ball.radius >= GRID_HEIGHT then
        ball.y = GRID_HEIGHT - ball.radius
        ball.dy = -ball.dy
    end

    if ball.y - ball.radius <= 0 then
        ball.y = ball.radius
        ball.dy = -ball.dy
    end

    -- Ball Player collision
    if ball.x + ball.radius >= player2.x
        and ball.x - ball.radius <= player2.x + PADDLE_WIDTH
        and ball.y + ball.radius >= player2.y
        and ball.y - ball.radius <= player2.y + PADDLE_HEIGHT then

        ball.x = player2.x - ball.radius
        ball.dx = -ball.dx
    end

    if ball.x - ball.radius <= player1.x + PADDLE_WIDTH
        and ball.x + ball.radius >= player1.x
        and ball.y + ball.radius >= player1.y
        and ball.y - ball.radius <= player1.y + PADDLE_HEIGHT then

        ball.x = player1.x + PADDLE_WIDTH + ball.radius
        ball.dx = -ball.dx
    end

    -- Scoring
    if ball.x + ball.radius >= GRID_WIDTH then
        player1_score = player1_score + 1
        resetBall(200)
    elseif ball.x - ball.radius <= 0 then
        player2_score = player2_score + 1
        resetBall(-200)
    end

    -- Player boundaries
    if player1.y <= 0 then
        player1.y = 0
    end

    if player2.y <= 0 then
        player2.y = 0
    end

    if player1.y + PADDLE_HEIGHT >= GRID_HEIGHT then
        player1.y = GRID_HEIGHT - PADDLE_HEIGHT
    end

    if player2.y + PADDLE_HEIGHT >= GRID_HEIGHT then
        player2.y = GRID_HEIGHT - PADDLE_HEIGHT
    end
end

function love.keypressed(key) 
    if key == "return" and gameState == "menu" then
        gameState = "play"
    elseif key == "p" and gameState == "play" then
        gameState = "pause"
    elseif key == "p" and gameState == "pause" then
        gameState = "play"
    end
end
function love.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(scoreFont)

    if gameState == "menu" then
        love.graphics.print("PONG GAME", 300, 200)
        love.graphics.print("Press ENTER to Start", 250, 300)
        return
    end

    if gameState == "pause" then
        love.graphics.print("PAUSED", 320, 200)
        love.graphics.print("Press P to Resume", 270, 300)
    end

    love.graphics.rectangle("fill", player1.x, player1.y, PADDLE_WIDTH, PADDLE_HEIGHT)
    love.graphics.rectangle("fill", player2.x, player2.y, PADDLE_WIDTH, PADDLE_HEIGHT)

    love.graphics.circle("fill", ball.x, ball.y, ball.radius)

    love.graphics.print(player1_score, 60, 20)
    love.graphics.print(player2_score, GRID_WIDTH - 70, 20)
end
