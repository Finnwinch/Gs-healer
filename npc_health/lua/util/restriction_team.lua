for _,v in ipairs(player.GetAll()) do
    if TEAM_ONLINE[team.GetName(v:Team())] then return true end
    return false
end