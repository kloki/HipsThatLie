require 'slider'
require 'message'
require 'waves'
require 'mussels'
function love.load()
   math.randomseed( os.time() )
   screenheight=640
   screenwidth=1024
   debug=false
   myFont=love.graphics.newFont('font/ChronoTrigger.ttf',15)
   myHugeFont=love.graphics.newFont('font/ChronoTrigger.ttf',60)
   love.graphics.setFont(myFont)
   background=love.graphics.newImage("art/background.png")
   logo=love.graphics.newImage("art/stieflogo.png")

   mainMessage=message:new()
   mainMessage:textUpdate('Hit Space',0)
end

function love.draw()
   love.graphics.draw(background,0,0)
   love.graphics.draw(logo,5,screenheight-95)
   love.graphics.setFont(myHugeFont)
   love.graphics.printf("Zeg ken jij de mossel man?",0,200,1024,"center")
   love.graphics.setFont(myFont)
   mussels.draw()
   slider.draw()
   waves.draw()
   mainMessage:draw()

end

function love.update(dt)
   slider.update(dt)
   waves.update(dt)
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



