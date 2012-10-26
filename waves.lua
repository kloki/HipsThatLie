waves={
   wave1=love.graphics.newImage("art/wave1.png"),
   x1=108,
   y1=380,
   wave2=love.graphics.newImage("art/wave2.png"),
   x2=108,
   y2=370,
   counter=0,
   direction=1,
}


function waves.draw()
   love.graphics.draw(waves.wave1,waves.x1,waves.y1)
   love.graphics.draw(waves.wave2,waves.x2,waves.y2)
end


function waves.update(dt)
   if waves.direction==1 then
      waves.x1=waves.x1+15*dt
      waves.x2=waves.x2-15*dt
      waves.y1=waves.y1-5*dt
      waves.y2=waves.y2+5*dt
   else
      waves.x1=waves.x1-15*dt
      waves.x2=waves.x2+15*dt
      waves.y1=waves.y1+5*dt
      waves.y2=waves.y2-5*dt
   end
   waves.counter=waves.counter+dt
   if waves.counter>2 then
      waves.counter=0
      if waves.direction==1 then waves.direction=0 else waves.direction=1 end
   end 
end
