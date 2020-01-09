local x = 2
local y = 2

BLOCK = 1 PYRA = 2 PLAYER = 3  -- constant

local i = 1 local a = 0 local f = 0  local e = -632 local j = 1 local h = 0 local player = 0 local x = 1 local b = 4 local x = 2 local y = 2 local f = -630

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
            for j = 1,2 do
                --player = love.graphics.newImage("MAP/tile"..map[5]..".png")
                same[i][j] = love.graphics.newImage("MAP/tile"..map[i]..".png")
        end
    end
end      
function love.update(dt)--
   function love.keypressed(key)
        if key == "space"then
            f = f - 10
            end
        if key == "down"then
            f = f + 10
            end
        if key == "left"then
            e =  e + 10
        end
        if key == "right"then
            e = e - 10
        end
    end 
end    
function love.draw()
        for i = 1,12,1 
            do
                for j = 1,2
                    do
                        love.graphics.draw(same[1][j],e + 632 * i,f + 412 * j) -- mutiplie by size of the image and how many item you have example here j and i (and how many you want to loaad     
            end                                              
        end
    for  i = 1,5,1
        do
             x = 240
            love.graphics.draw(rot[j],e ,e)
            love.graphics.draw(rot[1],410,410)
            print(f)
            
    end
end