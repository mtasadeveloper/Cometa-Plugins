local ping = getPlayerPing(localPlayer)
local cpu = math.random(60,80)
local gpu = math.random (79.5,98)
local FPSLimit, lastTick, framesRendered, FPS = 90, getTickCount(), 0, 0

local OnRender = Event(function()
    local currentTick = getTickCount()
    local elapsedTime = currentTick - lastTick
    if (elapsedTime >= 1000) then
        FPS = framesRendered
        lastTick = currentTick
        framesRendered = 2
    else
        framesRendered = framesRendered + 1
    end

    if (FPS > FPSLimit) then
        FPS = FPSLimit
    end

    local time = getRealTime()
    local hours = time.hour
    local minutes = time.minute
    local seconds = time.second
    if (hours < 10) then
        hours = "0"..hours
    end

    if (minutes < 10) then
        minutes = "0"..minutes
    end
    payerID = getElementData(localPlayer, "ID") or 0

    dxDrawLine(19 - 1, 10 - 1, 19 - 1, 40, tocolor(70, 130, 180, 255), 1, false)
    dxDrawLine(489, 10 - 1, 19 - 1, 10 - 1, tocolor(70, 130, 180, 255), 1, false)
    dxDrawLine(19 - 1, 40, 489, 40, tocolor(70, 130, 180, 255), 1, false)
    dxDrawLine(489, 40, 489, 10 - 1, tocolor(70, 130, 180, 255), 1, false)
    dxDrawRectangle(19, 10, 470, 30, tocolor(0, 0, 0, 140), false)
    dxDrawLine(136, 40, 136, 10, tocolor(70, 130, 180, 255), 1, false)
    dxDrawLine(270, 39, 270, 9, tocolor(70, 130, 180, 255), 1, false)
    dxDrawLine(406, 40, 406, 10, tocolor(70, 130, 180, 255), 1, false)
    dxDrawText("PING : "..ping.."ms ", 17, 9, 136, 39, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawText("TIME : "..hours..":"..minutes.."", 142, 9, 261, 39, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawText("CCP : "..payerID, 280, 9, 399, 39, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawText("FPS  : "..tostring(FPS).."", 406, 10, 489, 39, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
end)

return {
    OnRender = OnRender,
}
