

GuessState = Class{__includes = BaseState}

function GuessState:init()
    
    
    --x,y = love.mouse.getPosition()
    --table.insert(cursorPositions, {x,y})
    
    -- Draws canvas
    canvas = love.graphics.newCanvas(500, 500)
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    love.graphics.setBlendMode('alpha')
    love.graphics.setCanvas()
end

function GuessState:enter(def)
    drawing = def.drawing
end

function GuessState:update(dt)


end

function GuessState:render()
    width, height = love.window.getDesktopDimensions()
    love.graphics.setColor(255,255,255,255)
    love.graphics.print(tostring(#cursorPositions), 100, 100)
    love.graphics.rectangle('fill',(width/2) - 250,(height/2) - 250,500,500)
    love.graphics.circle('fill', (width/2) - 400, height - 400, 100)
    love.graphics.circle('fill', (width/2) + 400, height - 400, 100)
    love.graphics.setColor(0,0,0,255)
    for p, position in ipairs(drawing) do 
        if p ~= #cursorPositions then
            xp = position[1]
            yp = position[2]
        
            love.graphics.rectangle('fill', xp, yp, 8, 8)
        end
    end

    if paused then
        --love.graphics.setFont(gFonts['medium'])
        love.graphics.print('GuessState is HERE', width/2,height/2)
    end
end