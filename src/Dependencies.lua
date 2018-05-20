
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
    ['desk'] = love.graphics.newImage('graphics/misstrialdesktexture.png'),
    ['yes'] = love.graphics.newImage('graphics/vbtn.png'),
    ['no'] = love.graphics.newImage('graphics/xbtn.png'),
    ['coffeespill'] = love.graphics.newImage('graphics/coffeespill.png'),
    ['main'] = love.graphics.newImage('graphics/misstrialrulesmenu.png'),
    ['judge'] = love.graphics.newImage('graphics/judgeDesk.png'),
    ['invisibleink'] = love.graphics.newImage('graphics/disappearinginkmodifire.png'),
    ['lefthand'] = love.graphics.newImage('graphics/lefthandmodifire.png'),
    ['limitedink'] = love.graphics.newImage('graphics/limitedinkmodifire.png')
}

gFrames = {

}


gFonts = {
    ['small'] = love.graphics.newFont('fonts/CapitalisTypOasisSmall.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/CapitalisTypOasis.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/CapitalisTypOasisLarge.ttf', 32),   
    ['digital'] = love.graphics.newFont('fonts/DS-DIGIT.TTF',32)
}