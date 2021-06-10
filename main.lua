--[[
    Author: Ahmad H. Mirza
    ahmadhasanmirza@gmail.com
]]

-- push resolution-handling library that allows you to focus on making your game with a fixed resolution.
-- https://github.com/Ulydev/push
push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

-- Initial speed for the paddles
PADDLE_SPEED = 200
--[[
    Funtion to initialize the game at startup.
]]
function love.load()
    -- set the default filter.
    -- linear: Scale image with linear interpolation - smoothed image
    -- nearest: Scale image with nearest neighbor interpolation - more grainy
    love.graphics.setDefaultFilter('nearest', 'nearest')
    -- Set custom fonth
    smallFont = love.graphics.newFont('font.ttf', 8)
    scoreFont = love.graphics.newFont('font.ttf', 32)

    -- set LÖVE2D's active font to the smallFont obect
    love.graphics.setFont(smallFont)

    -- render the window using the virtual resolution defined using push library.
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    -- initialize score variables
    player1Score = 0
    player2Score = 0

    -- paddle positions on the Y axis
    player1Y = 30
    player2Y = VIRTUAL_HEIGHT - 50

end

--[[
    update function that is called every frame,
    dt is the delta time supplied by LÖVE2d framework
]]
function love.update(dt)
    -- player 1 - left paddle
    if love.keyboard.isDown('w') then
        player1Y = player1Y - (PADDLE_SPEED * dt) -- add negative paddle speed to current Y scaled by deltaTime
    elseif love.keyboard.isDown('s') then
        player1Y = player1Y + PADDLE_SPEED * dt -- add positive paddle speed to current Y scaled by deltaTime
    end

    -- player 2 - right paddle
    if love.keyboard.isDown('up') then
        player2Y = player2Y - (PADDLE_SPEED * dt)
    elseif love.keyboard.isDown('down') then
        player2Y = player2Y + PADDLE_SPEED * dt
    end
end

--[[
    Function for handling keyboard inputs, 
    the function is called by LÖVE2D on each frame
]]
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

--[[
    Called after update by LÖVE2D, used to render stuff on the screen.
--]]
function love.draw()
    push:apply('start') -- begin rendering at virtual resolution

    -- love.graphics.clear(40/255, 45/255, 52/255, 255/255) --Clears the screen or active Canvas to the specified color.

    -- draw welcome text toward the top of the screen
    love.graphics.printf('Ping-Pong!', 0, 20, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(scoreFont)
    love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 - 50, VIRTUAL_HEIGHT / 3)
    love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH / 2 + 30, VIRTUAL_HEIGHT / 3)

    -- paddles and ball are rectangles of different dimensions
    love.graphics.rectangle('fill', 10, player1Y, 5, 20) -- Left paddle
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, player2Y, 5, 20) -- Right paddle
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4) --ball (center)

    push:apply('end')
end