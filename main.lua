local x = 2
local y = 2

BLOCK = 1 PYRA = 2 PLAYER = 3  -- constant

local i = 1 local a = 0 local f = 0  local e = 2 local j = 1 local h = 0 local player = 0 local x = 1 local b = 4 local x = 2 local y = 2

local ok = {} local same = {} local player = {} local rot = {}
-- array -- table --
local map = {BLOCK,PYRA,1,1,PLAYER,4,1,1,2,2,2,2,2,2,2,2,2,2,2}
local ok = {1,2,3,4,5}


    function love.load() -- howm many plaform you want or background

     for  i = 1,5,1
        do  
            rot[i] =  love.graphics.newImage("joueur/player"..ok[i]..".png") 
        end
     for i = 1,12,1 
        do
            same[i] = {}
            for j = 1,5 do
                --player = love.graphics.newImage("MAP/tile"..map[5]..".png")
                same[i][j] = love.graphics.newImage("MAP/tile"..map[i]..".png")
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
                            love.graphics.draw(same[1][2],e + 800 - 632* i , -600 + j  *  418) -- mutiplie by size of the image 
            end                                              
        end
    for  i = 1,5,1
        do
            x = 240

            love.graphics.draw(rot[2],e,e)
            love.graphics.draw(rot[1],x - e ,410)
    end
end