

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

    modifiers = {
        [1] = true,
        [2] = true
    }
end

function GuessState:enter(def)
    drawing = def.drawing
end

function GuessState:update(dt)
    if self:isHover((width/2) - 400 -100, height - 400 + 50, 100, 100) then
        if love.mouse.isDown(1) then
            gStateMachine:change('play',{
                modifier = modifiers[math.random(1,4)]
            })
        end
    end

    if self:isHover((width/2) + 400 + 100, height - 400 + 50, 100, 100) then
        if love.mouse.isDown(1) then
            gStateMachine:change('play',{
                modifier = modifiers[math.random(1,4)]
            })
        end
    end
end

function GuessState:render()
    width, height = love.window.getDesktopDimensions()
    love.graphics.setColor(255,255,255,255)
    love.graphics.print(tostring(#cursorPositions), 100, 100)
    love.graphics.draw(gTextures['judge'],0,0)
    love.graphics.draw(gTextures['yes'], 0 ,0)
    love.graphics.draw(gTextures['no'], 0 ,0)
    love.graphics.rectangle('fill',(width/2) - 250,(height/2) - 250,500,500)
    
    love.graphics.setColor(0,0,0,255)
    for p, position in ipairs(drawing) do 
        if p ~= #cursorPositions then
            xp = position[1]
            yp = position[2]
        
            love.graphics.rectangle('fill', xp, yp, 8, 8)
        end
    end

    if paused then
     
    end
end

function GuessState:isHover(x,y,width,height)
    xc, yc = love.mouse.getPosition()
    if xc > x and xc < x + width then
        if yc > y and yc < y + height then
            return true
        end
    end
    return false
end