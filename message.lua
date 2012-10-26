require 'utils'
message={
   counter=0,
   text='huh',
   perm=false,
   winlines=love.filesystem.newFile('text.txt'):read():split("\n"),
}


function message:new (o)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   return o
end


function message:update(dt)
   self.counter=self.counter-dt

end

function message:draw()
   if self.counter > 0 or self.perm then
      love.graphics.setFont(myHugeFont)
      love.graphics.printf(self.text,0,430,1000,'center')
      love.graphics.setFont(myFont)
   end

end

function message:textUpdate(text,time)
   if time==0 then 
      self.perm=true
   else
      self.counter=time
      self.perm=false
   end
   self.text=text
end

function message:Mis()
   self:textUpdate("De mosselman?",1)
   TEsound.play("sounds/mis.wav")
end

function message:Hit()
   self:textUpdate("Hij woont in Scheveningen!",1)
   TEsound.play("sounds/hit.wav")
end

function message:win(score)
   self:textUpdate(self.winlines[math.random(4)],0)
   TEsound.play("sounds/end.wav")
end