function InterfaceHealer()
local affiche = Material("materials/npc_hearler/base.png")
local imageWidth, imageHeight = 723,254

pan = vgui.Create("DPanel")
pan:SetSize(imageWidth, imageHeight)
pan:Center()
pan:MakePopup()
    
function pan:Paint(w, h)
        local scale = math.min(w / imageWidth, h / imageHeight)
        local scaledWidth, scaledHeight = imageWidth * scale, imageHeight * scale
    
        local x = (w - scaledWidth) / 2
        local y = (h - scaledHeight) / 2
    
        surface.SetMaterial(affiche)
        surface.SetDrawColor(255, 255, 255, 255)
        surface.DrawTexturedRect(x, y, scaledWidth, scaledHeight)

        draw.RoundedBox(0,w*.29,h*.6,100*4.4,10,Color(5,4,50))
        local vie = LocalPlayer():Health()
        if LocalPlayer():Health() > 100 then vie = 100 end
        draw.RoundedBox(0,w*.29,h*.6,vie*4.4,10,Color(0,158,0))
        local price 
        if GetGlobal2Int("HealerValue") == 0 then
            price = "Impossible"
        else
            price = GetGlobal2Int("HealerValue").." €"
        end
        draw.DrawText(price,"title",w*.489,h*.86,Color(255,255,255),TEXT_ALIGN_CENTER)
    
        draw.RoundedBox(0,w*.745,h*.55,2.5,10,Color(255,255,255)) -- 75 bar
        draw.DrawText("75","sub-title",w*.745,h*.49,Color(255,255,255),TEXT_ALIGN_CENTER) -- 75 text

        draw.RoundedBox(0,w*.44,h*.55,2.5,10,Color(255,255,255)) -- 25 bar
        draw.DrawText("25","sub-title",w*.44,h*.49,Color(255,255,255),TEXT_ALIGN_CENTER) -- 25 text
        
        draw.RoundedBox(0,w*.29,h*.64,2.5,10,Color(255,255,255)) -- 0 bar
        draw.DrawText("0","sub-title",w*.29,h*.675,Color(255,255,255),TEXT_ALIGN_CENTER) -- 0 text
        
        draw.RoundedBox(0,w*.591,h*.64,2.5,10,Color(255,255,255)) -- 50 bar
        draw.DrawText("50","sub-title",w*.591,h*.675,Color(255,255,255),TEXT_ALIGN_CENTER) -- 50 text
        
        draw.RoundedBox(0,w*.895,h*.64,2.5,10,Color(255,255,255)) -- 100 bar
        draw.DrawText("100","sub-title",w*.895,h*.675,Color(255,255,255),TEXT_ALIGN_CENTER) -- 100 text
end
    
local close = vgui.Create("DButton", pan)
close:SetText("")
close:SetPos(pan:GetWide() - 54, 105)
close:SetSize(25,25)
function close:Paint(w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(255, 0, 0,0))
end
function close:DoClick()
        pan:Remove()
end

local action = vgui.Create("DButton", pan)
action:SetText("")
action:SetPos( pan:GetWide()/1.63, pan:GetTall()-42)
action:SetSize(285, 52)
function action:Paint(w, h)
        draw.DrawText("Soigner","title",w*.5,h*.1,Color(255,255,255),TEXT_ALIGN_CENTER)
        draw.RoundedBox(0, 0, 0, w, h, Color(255,0,0, 0))
end
function action:DoClick()
    pan:Remove()
    net.Start("requestHealth")
    net.SendToServer()
end
end