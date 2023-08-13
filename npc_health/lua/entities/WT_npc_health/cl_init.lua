include('shared.lua')

net.Receive("VguiHealer",function()
    include("vgui/healer.lua")
    InterfaceHealer()
end)

function ENT:Draw()  
    self:DrawModel()
    self:ResetSequence("idle_all_01")
end