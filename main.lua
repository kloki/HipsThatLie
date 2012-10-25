require 'slider'
require 'message'

function love.load()
   math.randomseed( os.time() )
   screenheight=640
   screenwidth=1024
   debug=true
   myFont=love.graphics.newFont('font/ChronoTrigger.ttf',15)
   myHugeFont=love.graphics.newFont('font/ChronoTrigger.ttf',100)
   love.graphics.setFont(myFont)
   mainMessage=message:new()
   mainMessage:load('Hit Space',1)
end

function love.draw()
   slider.draw()
   mainMessage:draw()
end

function love.update(dt)
   slider.update(dt)
   mainMessage:update(dt)
end


function love.keypressed(key)

   if key=='escape' then
      love.event.quit()
   elseif key==' ' then
      slider.hit()
   elseif key=='up' then
      slider.speedAdjust(0.1)
   elseif key=='down' then
      slider.speedAdjust(-0.1)
   elseif key=='d' then
      if debug then debug=false else debug=true end
   end


end


function love.quit()
  print("One step closer to world hegemony.")
end



