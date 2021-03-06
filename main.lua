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
        ['play'] = function() return PlayState() end,
        ['guess'] = function() return GuessState() end
    }
    
    gSounds['jazz']:setLooping(true)
    gSounds['jazz']:setVolume(0.5)
    gSounds['jazz']:play()

    gStateMachine:change('start')

    love.keyboard.keysPressed = {}
    love.mouse.keysPressed = {}
end

function love.mouse.wasPressed(key)
    return love.mouse.keysPressed[key]
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
    love.mouse.keysPressed = {}
end

function love.draw()
    gStateMachine:render()
end

-- Clamps a number to within a certain range, with optional rounding
function math.clamp(low, n, high) 
    return math.min(math.max(n, low), high) 
end