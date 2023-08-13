net.Receive("requestHealth",function(_,ply)
    if ply:Health() >= 100 then
        net.Start("HealerNotif")
        net.WriteString("tabarnak !, Vous êtes déjà en parfaite santé")
        net.Send(ply)
        return false
    end
    local price = GetGlobal2Int("HealerValue")
    if ply:canAfford(price) then
        ply:addMoney(-price)
        ply:SetHealth(100)
    end
end)