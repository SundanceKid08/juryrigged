

PlayState = Class{__includes = BaseState}

function PlayState:init(defs)
    cursorPositions = {}
    canvasPositions = {}
    invisibleInk = true

    paused = false
    rounds = 1
    inkAllowed = 500
    
    xc, yc = love.mouse.getPosition()
    self.roundLimit = 2
    self.limit = 10
    self.start = 0
    self.stopwatch = 1
    
    -- Draws canvas
    canvas = love.graphics.newCanvas(500, 500)
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    love.graphics.setBlendMode('alpha')
    love.graphics.setCanvas()

    leftClue = cards['crimes'][math.random(1,10)]
    rightClue = cards['nouns'][math.random(1,10)]
end

function PlayState:enter(defs)
    self.modifier = defs.modifier
    rounds = 1
end

function PlayState:update(dt)

    if paused then
        if love.keyboard.wasPressed('return') then
            paused = false
            cursorPositions = {}
        end

        if rounds > self.roundLimit then
            gStateMachine:change('guess', {
                drawing = canvasPositions
            })
        end
    end

    if not paused then
        if love.mouse.isDown(1) then
            if self.start == 0 then
                self.start = love.timer.getTime()
            end
            
            if self:isHover((width/2) - 250,(height/2) - 250, 500, 500) then
                x,y = love.mouse.getPosition()
                table.insert(cursorPositions, {x,y})
            end
        end

        if love.mouse.wasPressed(1) or self.start > 0 then
            self.stopwatch = self.limit - self:round(self:milliseconds_to_seconds(love.timer.getTime() - self.start))
        end

        if #cursorPositions > inkAllowed or self.stopwatch < 0 then
            rounds = rounds + 1
            self.start = 0
            paused = true
        end
        
        for k,v in ipairs(cursorPositions) do 
            table.insert(canvasPositions, v) 
        end
    end
end

function PlayState:render()
    width, height = love.window.getDesktopDimensions()
    
    love.graphics.setColor(255,255,255,255)
    love.graphics.print(tostring(#cursorPositions), 100, 100)
    love.graphics.draw(gTextures['desk'], 0 ,0)
    --love.graphics.draw(gTextures['coffeespill'],0,0)
    love.graphics.rectangle('fill',(width/2) - 250,(height/2) - 250,500,500)
    love.graphics.rectangle('fill',(width/2) - 402 + 30,(height) - 172,250,100)
    love.graphics.rectangle('fill',(width/2) - 2,(height) - 172,250,100)

    
    
    love.graphics.setColor(0,0,0,255)
    love.graphics.setFont(gFonts['small'])
    love.graphics.print(leftClue,(width/2) - 402 + 30 + 20, (height) - 172 + 50)
    love.graphics.print(rightClue,(width/2) - 2 + 20,(height) - 172 + 50)
    if not invisibleInk then
        for p, position in ipairs(canvasPositions) do 
            if p ~= #cursorPositions then
                xp = position[1]
                yp = position[2]
                love.graphics.rectangle('fill', xp, yp, 8, 8)
            end
        end
    else 
        for p, position in ipairs(cursorPositions) do 
            if p ~= #cursorPositions then
                xp = position[1]
                yp = position[2]
                love.graphics.rectangle('fill', xp, yp, 8, 8)
            end
        end
    end
        

    if self.start > 0 then
        love.graphics.setColor(255,0,0,255)
        love.graphics.setFont(gFonts['digital'])
        love.graphics.print(tostring(self.stopwatch), 200, 200)
    end

    love.graphics.setColor(0,0,0,255)
    if not self:isHover((width/2) - 400 + 30, height - 172, 245, 95) then
        love.graphics.rectangle('fill',(width/2) - 400 + 30,(height) - 172,245,95)
    end
    if not self:isHover(width/2, height - 172, 245, 95) then
        love.graphics.rectangle('fill',(width/2), height - 172,245,95)
    end

    if paused then
        love.graphics.setFont(gFonts['large'])
        love.graphics.print('SWITCH PLAYERS', (width/2) - 150,height/2 - 200)
    end
end

function PlayState:isHover(x,y,width,height)
    xc, yc = love.mouse.getPosition()
    if xc > x and xc < x + width then
        if yc > y and yc < y + height then
            return true
        end
    end
    return false
end

function PlayState:milliseconds_to_seconds(milliseconds)
    seconds = milliseconds % 1000
    return seconds
end

function PlayState:round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end


  
