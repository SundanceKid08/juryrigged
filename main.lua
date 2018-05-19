--[[ 
    GD50 Final Project

    Art:

    Music:


]]

require 'src/Dependencies'


function love.load()

    love.window.setTitle('Trial')
    love.window.setFullscreen(true)

    math.randomseed(os.time())

    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end,
        ['play'] = function() return PlayState() end
    }
    
    gSounds['jazz']:setLooping(true)
    gSounds['jazz']:setVolume(0.5)
    gSounds['jazz']:play()

    gStateMachine:change('start')

    love.keyboard.keysPressed = {}
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end

    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.update(dt)
    gStateMachine:update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw()
    gStateMachine:render()
end