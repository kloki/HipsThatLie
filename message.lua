message={
   counter=0,
   text='huh',
}


function message:new (o)
      o = o or {}
      setmetatable(o, self)
      self.__index = self
      return o
end

function message:load(text,time)
   self.text=text
   self.counter=time
end

function message:update(dt)
   self.counter=self.counter-dt

end

function message:draw()
   if self.counter > 0 then
      love.graphics.setFont(myHugeFont)
      love.graphics.printf(self.text,0,450,1000,'center')
      love.graphics.setFont(myFont)
   end

end

function message.textUpdate(text,time)
   self.counter=time
   self.text=text
end

function message.Hit()
   self.textUpdate("De mosselman?",1)
end

function message.Mis()
   self.textUpdate("Hij woont in Scheveningen 1",1)
end
