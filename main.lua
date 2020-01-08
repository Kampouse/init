local x = 2
local y = 2
local i = 1
local x = 1
local b = 4
local h = 0
BLOCK = 1
PYRA = 2
local map = {BLOCK,PYRA,1,1,1,4,1,1,2,2,2,2,2,2,2,2,2,2,2}
local minima = {}
local a = 0
local f = 0 
local e = 2
local same = {}
local j = 1
    function love.load() -- howm many plaform you want or background
     for i = 1,12,1 
        do
            same[i] = {}
            for j = 1,5 do
                same[i][j] = love.graphics.newImage("tile"..map[i]..".png")
            --table.insert(same,love.graphics.newImage("tile"..map[i]..".png"))
           -- table.insert(minima,love.graphics.newImage("tile"..map[2]..".png")
        end
    end
end      
function love.update(dt)--
   function love.keypressed(key)
        if key == "left"then
            e =  e + 50
        end
        if key == "right"then
            e = e - 20
        end
    end 
end    
    function love.draw()
        for i = 1,12,1 
            do
                for j = 1,5
                        do
                        x = e + i * 600 + 200 
            -- love.graphics.draw(minima[i],e - 160 * i , 140) 
                            love.graphics.draw(same[3][2],e + 800 - 632* i , -600 + j  *  418) -- mutiplie by size of the image 
        end
    end
end


