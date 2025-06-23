QBCore = exports['qb-core']:GetCoreObject()

function GetGangData(src)
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return nil end

    local result = MySQL.Sync.fetchAll('SELECT * FROM gangs WHERE leader = @cid OR JSON_CONTAINS(members, @cid)', {
        ['@cid'] = Player.PlayerData.citizenid
    })

    if #result < 1 then return nil end

    local gang = result[1]
    local members = json.decode(gang.members or "{}")

    return {
        gang = gang.name,
        rank = gang.leader == Player.PlayerData.citizenid and "القائد" or (members[Player.PlayerData.citizenid] or "عضو"),
        members = members,
        bank = gang.bank,
    }
end
