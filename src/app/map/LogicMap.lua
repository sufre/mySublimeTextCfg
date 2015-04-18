require("RealGrid")
require("VirtualGrid")

local LogicMap = class("LogicMap")

function LogicMap:ctor(x, y, borderLen)
    self.x = x
    self.y = y
    self.b = borderLen

    self.map = {}
    self.vmap = {}
    for i = 1, self.x -1 do
        self.map[i] = {}
        self.vmap[i] = {}
        for j = 1, self.y - 1 do
            self.vmap[i][j] = nil
        end
    end
    self.map[self.x] = {}
    self.map[self.x][self.y] = nil

    local virtualGridWidth = 1.5 * self.b
    local virtualGridHeight = 1.732 * self.b
    local startPoint = cc.p(self.b, 0.5 * 1.732 * self.b)
    for j = 1, self.y -1 do
        for i = 1, self.x - 1 do
            self.vmap[i][j] = VirtualGrid.new(i, j, 
                startPoint.x, startPoint.y,
                virtualGridWidth, virtualGridHeight)
            startPoint = cc.pAdd(startPoint, cc.p(virtualGridWidth, 0))
        end
        startPoint = cc.pAdd(startPoint, cc.p(0, virtualGridHeight))
    end

    startPoint = cc.p(self.b, 0.5 * 1.732 * self.b)
    for i = 1, self.x do
        if x % 2 == 0 then
            startPoint = cc.p(self.b + (i - 1) * virtualGridWidth, 0.5 * 1.732 * self.b)
        else
            startPoint = cc.p(self.b + (i - 1) * virtualGridWidth, 0.5 * 1.732 * self.b)
        end
        
        for j = 1, self.y do
            if x % 2 == 0 then
                self.map[i][j] = RealGrid(x, y)
            else
            end
        end
    end
end

function LogicMap:at(x, y)
    local virtualGrid = self.vmap[x][y]
    if virtualGrid ~= nil then
        return virtualGrid:getRealGridPoint(1)
    end
    if x == self.x and y == self.y then

    end
end