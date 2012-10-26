mussels={
   count=10,
   x=0,
   y=0,
   mussel=love.graphics.newImage("art/mossel.png"),
}


function mussels.draw()
   mussels.x=5
   mussels.y=75
   for i=1,mussels.count do
      love.graphics.draw(mussels.mussel,mussels.x,mussels.y)
      mussels.x=mussels.x+32	
   end
end

function mussels.hit()
   mussels.count=mussels.count-1
   if mussels.count==0 then endGame() end
end