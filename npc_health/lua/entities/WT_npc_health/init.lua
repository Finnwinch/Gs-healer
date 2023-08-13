AddCSLuaFile('shared.lua')
AddCSLuaFile('cl_init.lua')
include('shared.lua')

function ENT:Initialize()
	self:SetModel(MODEL)
    self:SetSolid(SOLID_BBOX)
    self:SetUseType(SIMPLE_USE)
    local phys = self:GetPhysicsObject()
    if ( !IsValid( phys ) ) then return end
    phys:Wake()
end


function ENT:Use(activator)
    local control = include("util/restriction_team.lua")
    if control then 
        net.Start("HealerNotif")
        net.WriteString("tabarnak !, Il y a déjà un médecin en ville")
        net.Send(activator)
        return false 
    end
    SetGlobal2Int("HealerValue",FORMULE(activator:Health()))
    net.Start("VguiHealer")
    net.Send(activator)
end
