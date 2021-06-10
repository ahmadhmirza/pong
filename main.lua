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

--[[
    Funtion to initialize the game at startup.
]]
function love.load()
    -- set the default filter.
    -- linear: Scale image with linear interpolation - smoothed image
    -- nearest: Scale image with nearest neighbor interpolation - more grainy
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- render the window using the virtual resolution defined using push library.
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

--[[
    Called after update by LÖVE2D, used to render stuff on the screen.
--]]
function love.draw()
    love.graphics.printf(
        'Hello World!', 0, WINDOW_HEIGHT / 2 - 6, WINDOW_WIDTH, 'center')
end