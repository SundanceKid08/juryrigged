
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



gSounds = {
   ['jazz'] = love.audio.newSource('sounds/jazz_0.ogg', 'static')
}

gTextures = {
   
}

gFrames = {

}


gFonts = {
    gFonts = {
        ['medium'] = love.graphics.newFont('fonts/KeepCalm-Medium.ttf', 16)
    }
    
}