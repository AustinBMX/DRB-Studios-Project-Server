RegisterCommand("me", function(source , args , rawCommand)
    local _source = source
    local instance = GetPlayerRoutingBucket(_source)
    -- if instance == 1234 then    
        args = table.concat(args, ' ')
        local text = "serverid: ".._source..";  Text: "..json.encode(args)
        TriggerEvent('rdrp_admin:modlogServer',_source, "ME" ,text)
        TriggerClientEvent('me:event', -1, source, args, 0)
    -- else
        -- TriggerClientEvent('redem_roleplay:Tip',_source,"~COLOR_RED~Hold Up! ~COLOR_WHITE~You can't do that here!",5000)
    -- end
end)

RegisterCommand("do", function(source , args , rawCommand)
    local _source = source
    local instance = GetPlayerRoutingBucket(_source)
    -- if instance == 1234 then 
        args = table.concat(args, ' ')
        local text = "serverid: ".._source.."; Text: "..json.encode(args)
        TriggerEvent('rdrp_admin:modlogServer',_source, "DO", text)
        TriggerClientEvent('me:event', -1, source, args, 1)
    -- else
        -- TriggerClientEvent('redem_roleplay:Tip',_source,"~COLOR_RED~Hold Up! ~COLOR_WHITE~You can't do that here!",5000)
    -- end
end)

RegisterServerEvent("chat:me")
AddEventHandler("chat:me", function(args)
    local _source = source
    TriggerClientEvent('me:event', -1, source, args, 0)
end)