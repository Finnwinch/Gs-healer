if SERVER then
    
    MODEL = "models/player/skeleton.mdl"
    FORMULE = function(vie)
        return (100 - vie) * 5
    end
    TEAM_ONLINE = {
        ["Medic"] = true
    }

    util.AddNetworkString("VguiHealer")
    util.AddNetworkString("requestHealth")
    util.AddNetworkString("HealerNotif")

    resource.AddFile("materials/npc_hearler/base.png")
    
    include("network/sethealth.lua")

    AddCSLuaFile("network/notifhealth.lua")
    AddCSLuaFile("vgui/police.lua")
    AddCSLuaFile("vgui/healer.lua")
end
if CLIENT then
    include("network/notifhealth.lua")
end