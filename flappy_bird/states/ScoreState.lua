--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:init()
    self.bronze = love.graphics.newImage('bronze.png')
    self.width = self.bronze:getWidth()
    self.height = self.bronze:getHeight()
    self.silver = love.graphics.newImage('silver.png')
    self.width = self.silver:getWidth()
    self.height = self.silver:getHeight()
    self.gold = love.graphics.newImage('gold.png')
    self.width = self.gold:getWidth()
    self.height = self.gold:getHeight()
    self.x = VIRTUAL_WIDTH/2-15
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.setColor(0,0,255)
    love.graphics.printf('Oops! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
    if self.score == 0 then
        love.graphics.printf('No Award.', 0, 130, VIRTUAL_WIDTH,'center')
    elseif self.score <=10 then
        love.graphics.printf('You got a Bronze Award!', 0, 130, VIRTUAL_WIDTH,'center')
        love.graphics.setColor(1,255,255,255)
        love.graphics.draw(self.bronze,self.x,150)
    elseif self.score >= 11 and self.score <=20 then
        love.graphics.printf('You got a Silver Award!', 0, 130, VIRTUAL_WIDTH,'center')
        love.graphics.setColor(1,255,255,255)
        love.graphics.draw(self.silver,self.x,150)
    elseif self.score  >= 21 then
        love.graphics.printf('You got a Gold Award!', 0, 130, VIRTUAL_WIDTH,'center')
        love.graphics.setColor(1,255,255,255)
        love.graphics.draw(self.gold,self.x,150)
    end
    love.graphics.setColor(1,255,255,255)
    love.graphics.printf('Press Enter to Play Again!', 0, 220, VIRTUAL_WIDTH, 'center')
end
