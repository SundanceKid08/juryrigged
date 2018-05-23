Button = Class{}

function Button:init(x, y, width, height, shape, onPress)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.shape = shape 
    self.onPress = onPress
end

function Button:update(dt)
    if GuessState:isHover(x,y,width,height) then
        if love.mouse.isDown(1) then
            self.onPress()
        end
    end
end

function Button:getPosition()
    return self.x, self.y
end

function Button:getWidth()
    return self.width
end

function Button:getHeight()
    return self.height
end
