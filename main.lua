--[[
    Author: Ahmad H. Mirza
    ahmadhasanmirza@gmail.com
]]

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

--[[
    Funtion to initialize the game at startup.
]]
function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true -- graphics technology that synchronizes the frame rate of a game with the monitor's refresh rate
    })
end

--[[
    Called after update by LÖVE2D, used to render stuff on the screen.
--]]
function love.draw()
    love.graphics.printf(
        'Hello World!', 0, WINDOW_HEIGHT / 2 - 6, WINDOW_WIDTH, 'center')
end