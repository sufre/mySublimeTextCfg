Person={}
 
function Person:new(p)
    local obj = p
    if (obj == nil) then
        obj = {name="ChenHao", age=37, handsome=true}
    end
    self.__index = self
    return setmetatable(obj, self)
end
 
function Person:toString()
    return self.name .." : ".. self.age .." : ".. (self.handsome and "handsome" or "ugly")
end

me = Person:new()
print(me:toString())
 
kf = Person:new{name="King's fucking", age=70, handsome=false}
print(kf:toString())