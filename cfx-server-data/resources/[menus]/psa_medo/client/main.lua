RegisterNetEvent("me:event")
local players = {}
local doPlayers = {}

CreateThread(function()
    local lstr = ""
    while true do
        Wait(0)
        local tick = GetGameTimer()
        local str = ""
        local removes = {}
        for a, b in next, players do
            if b.rtime < tick then
                removes[#removes+1] = a
            end
            local p = GetPlayerFromServerId(a)
            if NetworkIsPlayerActive(p) then
                local ped = GetPlayerPed(p)
                if DoesEntityExist(ped) then
                    local coords = GetPedBoneCoords(ped, 0x796e, 0.0, 0.0, 0.0) --HEAD
                    local ons, x, y = GetHudScreenPositionFromWorldPosition(coords.x, coords.y, coords.z-0.4)
                    if not ons then
                        x = (x*100)
                        y = (y*70)
                        str = str.."<p style=\"left: "..x.."%;top: "..y.."%;-webkit-transform: translate(-50%, 0%);max-width: 100%;position: fixed;text-align: center;color: #ffffff;background-color: #000000AA;border-radius:3px;\"><b>⠀"..b.message.."⠀</b></p>"
                    end
                end
            end
        end
        if #removes > 0 then
            for a, b in ipairs(removes) do
                players[b] = nil
            end
        end
        if str ~= lstr then
            SendNUIMessage({meta = "me", html = str})
            lstr = str
        end
    end
end)

CreateThread(function()
    local lstr = ""
    while true do
        Wait(0)
        local tick = GetGameTimer()
        local str = ""
        local removes = {}
        for a, b in next, doPlayers do
            if b.rtime < tick then
                removes[#removes+1] = a
            end
            local p = GetPlayerFromServerId(a)
            if NetworkIsPlayerActive(p) then
                local ped = GetPlayerPed(p)
                if DoesEntityExist(ped) then
                    local coords = GetPedBoneCoords(ped, 0x796e, 0.0, 0.0, 0.0) --HEAD
                    local ons, x, y = GetHudScreenPositionFromWorldPosition(coords.x, coords.y, coords.z+0.4)
                    if not ons then
                        x = (x*100)
                        y = (y*100)
                        str = str.."<p style=\"left: "..x.."%;top: "..y.."%;-webkit-transform: translate(-50%, 0%);max-width: 100%;position: fixed;text-align: center;color: #fc0303;background-color: #000000AA;border-radius:3px;\"><b>⠀"..b.message.."⠀</b></p>"
                    end
                end
            end
        end
        if #removes > 0 then
            for a, b in ipairs(removes) do
                doPlayers[b] = nil
            end
        end
        if str ~= lstr then
            SendNUIMessage({meta = "do", html = str})
            lstr = str
        end
    end
end)

AddEventHandler("me:event", function(source, message, type1)

    source = tonumber(source)
    local sonid = GetPlayerFromServerId(source)
    local monid = PlayerId()
    if #(GetEntityCoords(GetPlayerPed(monid)) - GetEntityCoords(GetPlayerPed(sonid))) < 8.0 and HasEntityClearLosToEntity( GetPlayerPed(monid), GetPlayerPed(sonid), 17 ) then
        if type1 == 0 then 
            players[source] = {message = fix(message), rtime = 7000+GetGameTimer()} 
        elseif type1 == 1 then 
            doPlayers[source] = {message = fix(message), rtime = 7000+GetGameTimer()} 
        end
    end --peassa
end)

function fix(string)
    string = string.gsub(string, "&", "&amp")
    string = string.gsub(string, "<", "&lt")
    string = string.gsub(string, ">", "&gt")
    string = string.gsub(string, "\"", "&quot")
    string = string.gsub(string, "'", "&#039")
    return string
end