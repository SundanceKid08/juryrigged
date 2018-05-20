
--libraries
Class = require 'lib/class'
push = require 'lib/push'
Timer = require 'lib/knife.timer'


--utility

require 'src/StateMachine'
require 'src/Cards'

--game states
require 'src/states/BaseState'
require 'src/states/game/StartState'
require 'src/states/game/PlayState'
require 'src/states/game/GuessState'



gSounds = {
   ['jazz'] = love.audio.newSource('sounds/jazz_0.ogg', 'static')
}

gTextures = {
    ['desk'] = love.graphics.newImage('graphics/misstrialdesktexture.png')
}

gFrames = {

}


gFonts = {
    ['medium'] = love.graphics.newFont('fonts/CapitalisTypOasis.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/CapitalisTypOasisLarge.ttf', 32),   
    ['digital'] = love.graphics.newFont('fonts/DS-DIGIT.TTF',32)
}