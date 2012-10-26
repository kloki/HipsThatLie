slider={
   speed=1,
   bar=0,
   direction=1,
   widthbar=800,
   heigthbar=380,
   hitregion=0.14,
}


function slider.draw()
   if debug then
      love.graphics.print("Speed: ".. slider.speed,5,5)
      love.graphics.print("Bar  : ".. slider.bar,5,20)
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

      
end


function slider.hit()
   if math.abs(slider.bar)<slider.hitregion then
      mainMessage:Hit()
      slider.speedAdjust(0.2)
   else 
      mainMessage:Mis()
      slider.speedAdjust(-0.1)
      mussels.hit()
   end
   

end

function slider.speedAdjust(n)
   slider.speed=slider.speed+n
   if slider.speed <0.1 then 
      slider.speed =0.1 
      mainMessage:textUpdate('Jij bent echt heel slecht',5)
   end
end