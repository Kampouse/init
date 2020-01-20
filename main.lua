local x = 2
local y = 2

BLOCK = 1 PYRA = 2 PLAYER = 3  -- constant

local i = 1 local a = 0 local f = 0  local e = -632 local j = 1 local h = 0 local player = 0 local x = 1 local b = 4 local x = 2 local y = 2 local f = -630
local itemx = {}
local itemy = {}
local vrom = 0
local ok = {} local same = {} local player = {} local rot = {}
local id = 0
-- array -- table --
local map = {BLOCK,PYRA,1,1,PLAYER,4,1,1,2,2,2,2,2,2,2,2,2,2,2}
local locationx = 0
local locationy = 0
local ok = {1,2,3,4,5}
 -- complex drawing?
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

        love.physics.setMeter(32)
  -- create a world for the bodies to exist in with horizontal gravity
  -- of 0 and vertical gravity of 9.81
  world = love.physics.newWorld(0, 12.0*64, true)
  object = {} -- table to hold all our physical object
  -- let's create the ground
  object.ground = {}
  -- remember, the shape (the rectangle we create next) anchors to the
  -- body from its center, so we have to move it to (650/2, 650-50/2)
  object.ground.body = love.physics.newBody(world, -1000, 420)
  -- make a rectangle with a width of 650 and a height of 50
  object.ground.shape = love.physics.newRectangleShape(2000, 260)
  -- attach shape to body
  object.ground.fixture = love.physics.newFixture(object.ground.body,object.ground.shape)
  -- let's create a ball
  object.ball = {}
  -- place the body in the center of the world and make it dynamic, so
  -- it can move around
  object.ball.body = love.physics.newBody(world, -650, 260, "dynamic")
  -- the ball's shape has a radius of 20
  object.ball.shape = love.physics.newRectangleShape(50,100)
  -- Attach fixture to body and give it a density of 1.
  object.ball.fixture = love.physics.newFixture(object.ball.body, object.ball.shape, 1)
  joint = love.physics.newFrictionJoint( object.ground.body, object.ball.body,object.ball.body:getX(),260, true )
  joint:setMaxTorque(2)
    --touching = object.ball.body:isTouching(object.ground.body )
    object.ground.fixture:setFriction( 1.5)
        vit,vita = object.ball.body:getLinearVelocity( )
  object.ball.fixture:setRestitution(-0.8) -- let the ball bounce
  -- let's create a couple blocks to play around with
  object.block3 = {}

           

        object.block3.image = same[1][1]
        object.block3.body = love.physics.newBody(world,150,305,"kinematic")
        object.block3.image = same[1][1]
        object.block3.shape = love.physics.newRectangleShape(object.block3.image:getWidth()- 50 ,object.block3.image:getHeight() - 168 )
        object.block3.fixture = love.physics.newFixture(object.block3.body,object.block3.shape)
           
                 
               -- object.block3.list = {}

                      -- object.block3.list.table.insert(a,item.id);


                object.block3['draw'] = function(mousex,mouse)
                                love.graphics.draw(object.block3.image,mousex,mousey)
                                      
                                end
                

            object.block3["location"] = function(locationx,locationy,vroom)
                id  = id + vroom
                
                object.block3.locationx = locationx
                object.block3.locationy = locationy
                   object.block3.body = love.physics.newBody(world,object.block3.locationx,object.block3.locationy,"kinematic")
                   itemx[id] = object.block3.locationx
                   itemy[id] = object.block3.locationy
                object.block3.fixture =  love.physics.newFixture(object.block3.body,object.block3.shape)
                love.graphics.draw(object.block3.image,object.block3.locationx,object.block3.locationy)
                 for i = 1,id,1 do print(itemx[i],"what")
                 end

                
                       
            


        end





  object.block1 = {}
  object.block1.body = love.physics.newBody(world,-680, 200, "kinematic")
  object.block1.shape = love.physics.newRectangleShape( 206, 200) --  changed -- 
  -- A higher density gives it more mass.
  object.block1.fixture = love.physics.newFixture(object.block1.body,object.block1.shape, 0)
 
  object.block2 = {}
  object.block2.body = love.physics.newBody(world, 200, 600, "dynamic")
  object.block2.shape = love.physics.newRectangleShape(0, 0, 100, 50)
  object.block2.fixture = love.physics.newFixture(object.block2.body,object.block2.shape, 2)
  -- initial graphics setup
  -- set the background color to a nice blue
  love.graphics.setBackgroundColor(0.41, 0, 0.97)
  --love.window.setMode(2000,2000) -- set the window dimensions to 650 by 650
    

  
good = {object.block1.body,object.ground.body}
end



    
     
function love.update(dt)--
    world:update(dt)
    
 

function love.keypressed(key)
    for i = 1,2 do
      --if object.ball.body:isTouching(good[i]) -- is higher than the "good i"
        --then
             if object.ball.body:getY() < good[i]:getY() then
                if key == "down" then
            object.ball.body:applyForce(-900,-24000 * 4.4)
                --end 
        end
                    end
                end
end

if love.keyboard.isDown("left") then
        x = x  + 20
        print(x)
        object.block3.location(800 + x,250,1)
                
        --object.ball.body:applyForce(300, -300)
        object.ball.body:setLinearVelocity(-500, 768/2) -- ot change
  -- press the left arrow key to push the ball to the left
  elseif love.keyboard.isDown("right") then
   object.ball.body:setLinearVelocity(500, 768/2) -- to change
  -- press the up arrow key to set the ball in the air
  elseif love.keyboard.isDown("up") then
   object.ball.body:setPosition(-600, 100)
 --  elseif  love.keyboard.isDown("down") then
      --  object.ball.body:applyForce(-900,-6000)
    -- we must set the velocity to zero to prevent a potentially large
  -- velocity generated by the change in position
        object.ball.body:setLinearVelocity(10,10) 
  end
end  

 function love.mousepressed( mousex, mousey, button, istouch, presses )
        if button == 1 then
                object.block3.draw(800 + x,250)
                object.block3.location(800 + x,250,1)
                end
                end



function love.draw()
       

  -- set the drawing color to green for the ground
       -- love.graphics.setColor(0.28, 0.63, 0.05)
  -- draw a "filled in" polygon using the ground's coordinates
 -- love.graphics.polygon("fill",object.ground.body:getWorldPoints(object.ground.shape:getPoints()))
-- important 


  -- set the drawing color to red for the ball
  love.graphics.setColor(0.76, 0.18, 0.05)
  --love.graphics.circle("fill",object.ball.body:getX(), object.ball.body:getY(),object.ball.shape:getRadius())
   -- love.graphics.draw(same[1][j],object.ball.body:getX()  + 632 * i, 0 * j) -- mutiplie by size of the image and how many item you have example here j and i (and how many you want to loaad
       -- L  = f + 412 * j
        U = e + 632 * i
        for i = 1,12,1 
            do
                for j = 1,2
                    do
                        love.graphics.draw(same[1][j],object.ball.body:getX() + 632 *  i, 0 * j)
                        love.graphics.draw(object.block3.image, object.ball.body:getX(),250)
                        --object.block3.location(-318,250)
                        love.graphics.draw(object.block3.image, object.ball.body:getX()-318,250)
                      -- object.block3.location(400,400)
                      --  object.block3.location(700,500)
                      --   
                         -- mutiplie by size of the image and how many item you have example here j and i (and how many you want to loaad     
                                                       
            end         
        end
        

       -- object.block3.location(-318,250,1)
       -- object.block3.location(400,400,1)
       -- object.block3.location(700,500,1)

    for  i = 1,5,1
        do
         --  
            love.graphics.draw(rot[1],410,object.ball.body:getY())
            love.graphics.draw(rot[3],object.ball.body:getX() + 1050 ,250)
            love.graphics.draw(same[2][2],object.ball.body:getX(),250)
                vita,vit = object.ball.body:getLinearVelocity( ) 
               locationx =  object.ball.body:getX() + 1050
                for i = 1,id,1 do
                love.graphics.draw(object.block3.image,object.ball.body:getX() - itemx[id] * 0.10 ,itemy[id])
                end
                --print(locationx)
               
                if object.ball.body:isTouching(object.ground.body) then
                    --print(object.ball.body:getX())
                    print(object.ball.body:getX())
                    print(locationx,"locationx")
                    print(itemx[id],itemy[id])
                    --print(locationx,locationy)

                else 
                end

           
                -- touching = object.ball.body:isTouching(object.ground.body) 
                --print(object.ball.body:getX())
              
          -- make a cordinate system -- 
    end
    --print(locationx)
end