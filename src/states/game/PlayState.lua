

StartState = Class{__includes = BaseState}

function StartState:init()
    cursorPositions = {}
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
    if love.mouse.isDown(1) then
        x,y = love.mouse.getPosition()
        table.insert(cursorPositions,x)
        table.insert(cursorPositions,y)
    end
end

function StartState:render()
    width, height = love.window.getDesktopDimensions()
    love.graphics.setColor(255,255,255,255)
    love.graphics.print(tostring(#cursorPositions), 100, 100)
    love.graphics.rectangle('fill',(width/2) - 250,(height/2) - 250,500,500)
    love.graphics.setColor(0,255,0,255)
    for p, position in pairs(cursorPositions) do 
        if p ~= #cursorPositions then
            love.graphics.rectangle('fill',cursorPositions[p],cursorPositions[p+1],8,8)
        end
    end
end