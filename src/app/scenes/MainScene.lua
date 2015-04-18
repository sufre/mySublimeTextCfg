
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    local back = display.newSprite("back.png")
    back:pos(display.cx, display.cy)
    back:addTo(self)
    local grid = display.newSprite("grid.png")
    grid:setPosition(display.cx, display.cy)
    grid:addTo(self)

end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
