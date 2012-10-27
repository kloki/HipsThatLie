slider={
   speed=1,
   bar=0,
   direction=1,
   widthbar=800,
   heigthbar=380,
   hitregion=0.14,
   manL=love.graphics.newImage("art/mosselmanL.png"),
   manR=love.graphics.newImage("art/mosselmanR.png"),
   eastercount=0
}


function slider.draw()
   love.graphics.setFont(myHugeFont)
   love.graphics.print("Snelheid: ".. slider.speed*10,5,5)
   love.graphics.setFont(myFont)
   love.graphics.print("knopen",210,30)

   if slider.direction==0 then 
      love.graphics.draw(slider.manL,screenwidth/2-5+slider.widthbar/2*slider.bar-50,slider.heigthbar-50)
   else
      love.graphics.draw(slider.manR,screenwidth/2-5+slider.widthbar/2*slider.bar-50,slider.heigthbar-50)
   end
   if debug then
      love.graphics.print("Speed: ".. slider.speed,5,85)
      love.graphics.print("Bar  : ".. slider.bar,5,100)
      love.graphics.rectangle("line",screenwidth/2-slider.widthbar/2,slider.heigthbar,slider.widthbar,40)
      love.graphics.rectangle("line",screenwidth/2-slider.widthbar/2*slider.hitregion,slider.heigthbar,slider.widthbar*slider.hitregion,40)
      love.graphics.rectangle("fill",screenwidth/2-5+slider.widthbar/2*slider.bar,slider.heigthbar-10,10,60)
   
   

   end
end


function slider.update(dt)
   if slider.direction==1 then
      slider.bar=slider.bar+slider.speed*dt
      if slider.bar >1 then
	 slider.bar=slider.bar-(slider.bar-1)
	 slider.direction=0
      end
   elseif slider.direction==0 then
      slider.bar=slider.bar-slider.speed*dt
      if slider.bar <-1 then
	 slider.bar=slider.bar-(slider.bar+1)
	 slider.direction=1
      end
   end
   slider.eastercount=slider.eastercount+dt
      
end


function slider.hit()
   if math.abs(slider.bar)<slider.hitregion then
      mainMessage:Hit()
      slider.speedAdjust(0.2)
      if slider.eastercount<0.2 then easter=true end
      slider.eastercount=0
   else 
      mainMessage:Mis()
      if easter==false then slider.speedAdjust(-0.1) end
      mussels.hit()
   end
   

end

function slider.speedAdjust(n)
   slider.speed=slider.speed+n
   if slider.speed <0.1 then 
      slider.speed =0.1 
   end
end