

PlayState = Class{__includes = BaseState}

function PlayState:init(defs)
    cursorPositions = {}
    canvasPositions = {}
    paused = false
    rounds = 0
    inkAllowed = 100
    xc, yc = love.mouse.getPosition()
    --x,y = love.mouse.getPosition()
    --table.insert(cursorPositions, {x,y})
    
    -- Draws canvas
    canvas = love.graphics.newCanvas(500, 500)
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    love.graphics.setBlendMode('alpha')
    love.graphics.setCanvas()
end

function PlayState:update(dt)

    if paused then
        if love.keyboard.wasPressed('return') then
            paused = false
            cursorPositions = {}
        end

        if rounds > 5 then
            gStateMachine:change('guess', {
                drawing = canvasPositions
            })
        end
    end

    if not paused then
        if love.mouse.isDown(1) then
            x,y = love.mouse.getPosition()
            table.insert(cursorPositions, {x,y})
        end

        if #cursorPositions > inkAllowed then
            rounds = rounds + 1
            paused = true
        end

        for k,v in ipairs(cursorPositions) do 
            table.insert(canvasPositions, v) 
        end
    end

    xc, yc = love.mouse.getPosition()

end

function PlayState:render()
    width, height = love.window.getDesktopDimensions()
    love.graphics.setColor(255,255,255,255)
    love.graphics.print(tostring(#cursorPositions), 100, 100)
    love.graphics.rectangle('fill',(width/2) - 250,(height/2) - 250,500,500)
    love.graphics.rectangle('fill',(width/2) - 402,(height) - 102,250,100)
    love.graphics.rectangle('fill',(width/2) - 102,(height) - 102,250,100)
    love.graphics.setColor(0,0,0,255)
    for p, position in ipairs(canvasPositions) do 
        if p ~= #cursorPositions then
            xp = position[1]
            yp = position[2]
            love.graphics.rectangle('fill', xp, yp, 8, 8)
        end
    end

    love.graphics.setColor(0,0,0,255)
    if xc > (width/2) - 400 or xc < (width/2) - 400 + 300 and yc < (height-100) or yc > height then
        
            love.graphics.rectangle('fill',(width/2) - 400,(height) - 100,245,95)
    
    end
        love.graphics.rectangle('fill',(width/2) - 100,(height) - 100,245,95)

    if paused then
        --love.graphics.setFont(gFonts['medium'])
        love.graphics.print('SWITCH PLAYERS', width/2,height/2)
    end
end

