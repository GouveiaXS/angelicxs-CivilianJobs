ESX = nil
QBcore = nil

if Config.UseESX then
    ESX = exports["es_extended"]:getSharedObject()
elseif Config.UseQBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end

AddEventHandler('onResourceStart', function(resource)
    local partB = 'ngelicxs-CivilianJobs'
    local name = tostring('a'..partB)
    if GetCurrentResourceName() ~= name then
        print('This script was brought to you by A'..'ngelicXS! However, the resource name has been changed. Thank you for using this resource and consider renaming it to help support scripts like it.')
    end
end)


RegisterServerEvent('angelicxs-CivilianJobs:Server:Payment')
AddEventHandler('angelicxs-CivilianJobs:Server:Payment', function(amount)
    local src = source
    if Config.UseESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addAccountMoney(Config.AccountMoney,amount)
    elseif Config.UseQBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddMoney(Config.AccountMoney, amount)
    end
    TriggerClientEvent('angelicxs-CivilianJobs:Notify',src, Config.Lang['payment_notice_money']..amount, Config.LangType['success'])
end)

RegisterServerEvent('angelicxs-CivilianJobs:Server:GainItem')
AddEventHandler('angelicxs-CivilianJobs:Server:GainItem', function(name, amount)
    local src = source
    if Config.UseESX then
        local xPlayer = ESX.GetPlayerFromId(src)
		xPlayer.addInventoryItem(name, amount)
    elseif Config.UseQBCore then
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.AddItem(name, amount)
    end
    TriggerClientEvent('angelicxs-CivilianJobs:Notify',src, Config.Lang['payment_notice_item']..' '..tostring(amount)..' '..tostring(name), Config.LangType['success'])
end)

if Config.UseESX then
	ESX.RegisterUsableItem(Config.ScubaItemName, function(source)
		local xPlayer = ESX.GetPlayerFromId(source)
        TriggerEvent('angelicxs-CivilianJobs:ScubaJob:ScubaMode',source)
	end)
elseif Config.UseQBCore then
    QBCore.Functions.CreateUseableItem(Config.ScubaItemName, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        TriggerClientEvent('angelicxs-CivilianJobs:ScubaJob:ScubaMode', source)
    end) 
end