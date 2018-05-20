

StartState = Class{__includes = BaseState}

function StartState:init()
    canvas = love.graphics.newCanvas(500, 500)
    love.graphics.setCanvas(canvas)
    love.graphics.clear()
    love.graphics.setBlendMode('alpha')
    love.graphics.setCanvas()
end

function StartState:update(dt)

    if love.keyboard.wasPressed('return') then
        gStateMachine:change('play', {
            modifier = nil
        })
    end
  
end

function StartState:render()
    
    love.graphics.setColor(255,255,255,255)
    love.graphics.draw(gTextures['main'])

    --love.graphics.setFont(gFonts['medium'])
    love.graphics.print('WELCOME TO JURY SELECTION', 100, 100)

end