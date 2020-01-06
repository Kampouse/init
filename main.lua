local x = 2
local y = 2
local i = 1
local x = 1
local map = {1,4,1,1,1,4}
local a = 0
local e = -900    
    function love.load()
     for i = 1,6,1 
        do
            map[i] = love.graphics.newImage("tile"..map[i]..".png")
        end
    end
print(x,y)
function love.update(dt)--
   e = e 
    end 
    function love.draw()
        
        for i = 1,6,1
        do
            x = e + i * 600 + 200  
            love.graphics.draw(map[i],x,y)
        end 
    end







