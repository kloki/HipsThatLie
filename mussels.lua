mussels={
   count=10,
   x=0,
   y=0,
}


function mussels.draw()
   mussels.x=1000
   mussels.y=5
   for i=1,mussels.count do
      love.graphics.rectangle('fill',mussels.x,mussels.y,15,15)
      mussels.x=mussels.x-17	
   end
end

function mussels.hit()
   mussels.count=mussels.count-1
end