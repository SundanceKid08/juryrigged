

StartState = Class{__includes = BaseState}

function StartState:init()
    cursorPositions = {}
    paused = false
    --x,y = love.mouse.getPosition()
    --table.insert(cursorPositions, {x,y})
    

    -- Draws canvas
    canvas = love.graphics.newCanvas(500, 500)
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    love.graphics.setBlendMode('alpha')
    love.graphics.setCanvas()
end

function StartState:update(dt)


    if love.mouse.isDown(1) and not paused then
        x,y = love.mouse.getPosition()
        table.insert(cursorPositions, {x,y})
    end

    if #cursorPosition > 500 then
        paused = true
    end
end

function StartState:render()
    width, height = love.window.getDesktopDimensions()
    love.graphics.setColor(255,255,255,255)
    love.graphics.print(tostring(#cursorPositions), 100, 100)
    love.graphics.rectangle('fill',(width/2) - 250,(height/2) - 250,500,500)
    love.graphics.setColor(0,255,0,255)
    for p, position in ipairs(cursorPositions) do 
        if p ~= #cursorPositions then
            xp = position[1]
            yp = position[2]
        
            love.graphics.rectangle('fill', xp, yp, 8, 8)
        end
    end

    if paused then
        love.graphics.
        love.graphics.print('SWITCH PLAYERS')
end