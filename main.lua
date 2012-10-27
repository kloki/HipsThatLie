require 'slider'
require 'message'
require 'waves'
require 'mussels'
require 'highscore'
require 'TEsound'
function love.load()
   math.randomseed( os.time() )
   screenheight=640
   screenwidth=1024
   debug=false
   myFont=love.graphics.newFont('font/bebas.ttf',15)
   myHugeFont=love.graphics.newFont('font/bebas.ttf',40)
   love.graphics.setFont(myFont)
   background=love.graphics.newImage("art/background.png")
   logo=love.graphics.newImage("art/stieflogowit.png")
   mainMessage=message:new()
   pause=false
   pausecounter=5
   newGame()
   

end

function love.draw()
   love.graphics.draw(background,0,0)
   love.graphics.draw(logo,screenwidth-105,screenheight-95)
   love.graphics.setFont(myHugeFont)
   love.graphics.printf("Zeg ken jij de mossel man?",0,180,1024,"center")
   love.graphics.setFont(myFont)
   mussels.draw()
   slider.draw()
   waves.draw()
   highscore.draw()
   mainMessage:draw()


end

function love.update(dt)
   if pause then
      pausecounter=pausecounter-dt
      if pausecounter<0 then unpause() end
   else
      slider.update(dt)
      waves.update(dt)
      mainMessage:update(dt)
   end
   TEsound.cleanup()
end



function love.keypressed(key)

   if key=='escape' then
      love.event.quit()
   elseif key==' ' then
      if pause==false then
	 slider.hit()
      end
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


function newGame()
   mainMessage:textUpdate('Sla elkaar',0)
   slider.speed=1
   mussels.count=10
end

function endGame()
   mainMessage:win(slider.speed)
   highscore.update(slider.speed)
   pause=true
   pausecounter=3
end

function unpause()
   pause=false
   newGame()
end