ESX = nil
QBcore = nil
PlayerData, PlayerJob = nil, nil
FreeWork, MissionRoute, MissionVehicle, NPC, VehicleDestroyed, gettingMissionVehicle = false, nil, nil, nil, false, false

if not Config.UsePlayerJob then
    FreeWork = true
end

RegisterNetEvent('angelicxs-CivilianJobs:Notify', function(message, type)
	if Config.UseCustomNotify then
        TriggerEvent('angelicxs-CivilianJobs:CustomNotify',message, type)
	elseif Config.UseESX then
		ESX.ShowNotification(message)
	elseif Config.UseQBCore then
		QBCore.Functions.Notify(message, type)
	end
end)


CreateThread(function()
    if Config.UseESX then
        ESX = exports["es_extended"]:getSharedObject()
        
        while not ESX.IsPlayerLoaded() do
            Wait(100)
        end

        CreateThread(function()
            while true do
                PlayerData = ESX.GetPlayerData()
                if PlayerData ~= nil then
                    PlayerJob = PlayerData.job.name
                    break
                end
                Wait(100)
            end
        end)

        RegisterNetEvent('esx:setJob', function(job)
            PlayerJob = job.name
        end)
    elseif Config.UseQBCore then
        QBCore = exports['qb-core']:GetCoreObject()

        CreateThread(function ()
			while true do
                PlayerData = QBCore.Functions.GetPlayerData()
				if PlayerData.citizenid ~= nil then
					PlayerJob = PlayerData.job.name
					break
				end
				Wait(100)
			end
		end)

        RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
            PlayerJob = job.name
        end)
    end
end)

RegisterNetEvent('angelicxs-CivilianJobs:MAIN:SpawnBossNPC',function(model, coords, eventTrigger, eventTrigger2, askedEvent)
    if Config.UsePedAsJobBoss then
        local hash = HashGrabber(model)
        local pcoord = vector3(coords[1], coords[2], coords[3])
        if DoesEntityExist(NPC) then
            print(Config.ErrorCodes['dev'], Config.ErrorCodes['005'], tostring(askedEvent))
            return
        end
        NPC = CreatePed(3, hash, coords[1], coords[2], (coords[3]-1), coords[4], false, false)
        FreezeEntityPosition(NPC, true)
        SetEntityInvincible(NPC, true)
        SetBlockingOfNonTemporaryEvents(NPC, true)
        TaskStartScenarioInPlace(NPC,'WORLD_HUMAN_STAND_IMPATIENT', 0, false)
        SetModelAsNoLongerNeeded(model)
        if Config.UseThirdEye then
            if Config.ThirdEyeName == 'ox_target' then
                local ox_options = {
                    {
                        name = 'CivJobBossWork',
                        event = eventTrigger,
                        label = Config.Lang['request_work'],
                    }, {
                        name = 'CivJobBossReturn',
                        event = 'angelicxs-CivilianJobs:MAIN:RemoveVehicle',
                        label = Config.Lang['vehicle_return_request'],
                    }, {
                        name = 'CivJobBossHow',
                        event = eventTrigger2,
                        label = Config.Lang['ask_how_to'],
                    }
                }
                exports.ox_target:addLocalEntity(NPC, ox_options)
            else
                exports[Config.ThirdEyeName]:AddEntityZone('CivNPC', NPC, {
                    name="CivNPC",
                    debugPoly=false,
                    useZ = true
                    }, {
                    options = {
                        {
                            event = eventTrigger, 
                            label = Config.Lang['request_work'],
                        },   
                        {
                            event = 'angelicxs-CivilianJobs:MAIN:RemoveVehicle',
                            label = Config.Lang['vehicle_return_request'],
                        },     
                        {
                            event = eventTrigger2,
                            label = Config.Lang['ask_how_to'],
                        },     
                                
                    },
                    distance = 2
                })       
            end 
        end
        while true do
            local dist = #(pcoord-GetEntityCoords(PlayerPedId()))
            if dist > 50 then
                DeleteEntity(NPC)
                NPC = nil
                break
            end
            Wait(2000)
        end
    end
end)

RegisterNetEvent('angelicxs-CivilianJobs:MAIN:CreateVehicle', function(model, spawn, askedEvent)
    if not VehicleDestroyed then
        gettingMissionVehicle = true
        if DoesEntityExist(MissionVehicle) then
            print(Config.ErrorCodes['dev'], Config.ErrorCodes['006'], tostring(askedEvent))
        else
	    if type(spawn) == 'table' then
                spawn = Randomizer(spawn, askedEvent)
            end
            local hash = HashGrabber(model)
            ClearAreaOfVehicles(spawn.x,spawn.y,spawn.z, 5, false, false, false, false, false)
            MissionVehicle = CreateVehicle(hash, spawn.x,spawn.y,spawn.z, true, true)
            SetEntityHeading(MissionVehicle, spawn.w)
            FreezeEntityPosition(MissionVehicle, true)
            SetVehicleOnGroundProperly(MissionVehicle)
            FreezeEntityPosition(MissionVehicle, false)
            SetEntityAsMissionEntity(MissionVehicle, true, true)
            while not DoesEntityExist(MissionVehicle) do
                Wait(25)
            end
            TriggerEvent('angelicxs-CivilianJobs:VehicleInitation', MissionVehicle)
        end
        gettingMissionVehicle = false
    else
        TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['vehicle_destroyed_notice'], Config.LangType['info'])
    end
end)

RegisterNetEvent('angelicxs-CivilianJobs:MAIN:NoContinueMode', function(model, spawn, askedEvent)
    TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['continous_mode_no_explain'], Config.LangType['info'])
end)

RegisterNetEvent('angelicxs-CivilianJobs:MAIN:RemoveVehicle', function(area)
    local coords = area
    if Config.UsePedAsJobBoss then
        if DoesEntityExist(NPC) then
            coords = GetEntityCoords(NPC)
        else
            print(Config.ErrorCodes['dev'], Config.ErrorCodes['008'])
        end
    end
    local dist = #(GetEntityCoords(MissionVehicle)-coords)
    if DoesEntityExist(MissionVehicle) then
        local health = GetEntityHealth(MissionVehicle)
        if dist <= 15 then 
            DeleteEntity(MissionVehicle)
            MissionVehicle = nil
            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['vehicle_return'], Config.LangType['success'])
            TriggerEvent('angelicxs-CivilianJobs:Main:ResetJobs')
        elseif health <= 2 then
            DeleteEntity(MissionVehicle)
            MissionVehicle = nil
            if Config.VehicleSteward then
                VehicleDestroyed = true
                TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['vehicle_destroyed'], Config.LangType['info'])
            else
                TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['vehicle_return'], Config.LangType['success'])
            end
            TriggerEvent('angelicxs-CivilianJobs:Main:ResetJobs')
        else
            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['vehicle_far'], Config.LangType['success'])
        end
    else
        TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['vehicle_not_out'], Config.LangType['error'])
    end
end)

RegisterNetEvent('angelicxs-CivilianJobs:MAIN:RouteMarker', function(table, route, routeName, askedEvent)
    if not route then
        print(Config.ErrorCodes['dev'], Config.ErrorCodes['004'], tostring(askedEvent))
        return
    end
    if table then
        for i = 1, #route do
            MissionRoute = AddBlipForCoord(route[i].x, route[i].y, route[i].z)
            SetBlipColour(MissionRoute,Config.BlipMarkerColour)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(routeName)
            EndTextCommandSetBlipName(MissionRoute)
            SetBlipRoute(MissionRoute, true)
            SetBlipRouteColour(MissionRoute, Config.BlipRouteColour)
            while true do
                local sleep = 1100
                local coord = GetEntityCoords(PlayerPedId())
                local safeCoord = vector3(route[i].x, route[i].y, route[i].z)
                local dist = #(coord-safeCoord)
                if dist <= 75 then
                    sleep = 550
                    if dist <= 25 then
                        sleep = 0
                        if dist <= 15 then
                            RemoveBlip(MissionRoute)
                            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['at_route_marker'], Config.LangType['success'])
                            break
                        end
                    end
                end
                Wait(sleep)            
            end
        end    
    else
        MissionRoute = AddBlipForCoord(route.x, route.y, route.z)
        SetBlipColour(MissionRoute,Config.BlipMarkerColour)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(routeName)
        EndTextCommandSetBlipName(MissionRoute)
        SetBlipRoute(MissionRoute, true)
        SetBlipRouteColour(MissionRoute, Config.BlipRouteColour)
        while true do
            local sleep = 1100
            local coord = GetEntityCoords(PlayerPedId())
	    local safeCoord = vector3(route.x, route.y, route.z)
            local dist = #(coord-safeCoord)
            if dist <= 75 then
                sleep = 550
                if dist <= 25 then
                    sleep = 0
                    if dist <= 15 then
                        RemoveBlip(MissionRoute)
                        TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['at_route_marker'], Config.LangType['success'])
                        break
                    end
                end
            end
            Wait(sleep)            
        end
    end
end)

function Job3DText(location, event, event2)
    if Config.Use3DText then
        CreateThread(function()
            while true do
                local Sleep = 2000
                local Player = PlayerPedId()
                local Pos = GetEntityCoords(Player)
                local Dist = #(Pos - vector3(location.x,location.y,location.z))
                if Dist <= 50 then
                    Sleep = 500
                    if Dist <= 3 then
                        Sleep = 0
                        DrawText3Ds(location.x,location.y,location.z, Config.Lang['request_work_3d'])
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent(event)
                        elseif IsControlJustReleased(0,47) then
                            TriggerEvent('angelicxs-CivilianJobs:MAIN:RemoveVehicle')
                        elseif IsControlJustReleased(0,23) then
                            TriggerEvent(event2)
                        end
                    end
                end
                Wait(Sleep)
            end
        end)
    end
end

-- Map blip
function JobBlip(coords, sprite, colour, name)
    local jobBlip = AddBlipForCoord(coords)
    SetBlipSprite(jobBlip, sprite)
    SetBlipScale(jobBlip, Config.JobBlipSize)
    SetBlipAsShortRange(jobBlip, true)
    SetBlipColour(jobBlip, colour)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(name)
    EndTextCommandSetBlipName(jobBlip)
end

-- Mission Vehicle Check
function UsingMissionVehicle()
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped, true) then return false end
    if GetVehiclePedIsIn(ped, false) == MissionVehicle then return true end
    return false
end

-- Payment for distances
function DistancePayment(a, b, c, d, e)
    if not c or e then
        print(Config.ErrorCodes['dev'], Config.ErrorCodes['009'])
        return
    end
    local paymentAmount = tonumber(#(a-b)*d)
    TriggerServerEvent('angelicxs-CivilianJobs:Server:Payment', math.floor(paymentAmount))
end

-- Payment for completion
function PaymentFlat(a, b, c)
    if not b or c then
        print(Config.ErrorCodes['dev'], Config.ErrorCodes['010'])
        return
    end
    local paymentAmount = tonumber(a)
    TriggerServerEvent('angelicxs-CivilianJobs:Server:Payment', math.floor(paymentAmount))
end

function PaymentItem(a, b, c)
    if not b or c then
        print(Config.ErrorCodes['dev'], Config.ErrorCodes['011'])
        return
    end
    local amount = math.random(tonumber(a.min),tonumber(a.max))
    local name = tostring(a.name)
    TriggerServerEvent('angelicxs-CivilianJobs:Server:GainItem', name, math.floor(amount))
end

function PaymentItemMaterial(a, b, c)
    if not b or c then
        print(Config.ErrorCodes['dev'], Config.ErrorCodes['011'])
        return
    end
    local amount = math.random(tonumber(a.min),tonumber(a.max))
    local name = tostring(a.name)
    TriggerServerEvent('angelicxs-CivilianJobs:Server:GainItemMaterial', name, math.floor(amount))
end

-- Animation Loader
function LoadAnim(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(10) end
end


-- Load models
function HashGrabber(model)
    local counter = 0
    local hash = GetHashKey(model)
    if not HasModelLoaded(hash) then
        RequestModel(hash)
        Wait(10)
        counter = counter + 1
    end
    while not HasModelLoaded(hash) do
      Wait(10)
      counter = counter + 1
    end
    if counter >= 100 then
        print(Config.ErrorCodes['dev'], Config.ErrorCodes['003'], tostring(model))
    end
    return hash
end

-- Random selector
function Randomizer(list, askedEvent)
    if list ~= nil then
        local current = 0
        local selection = math.random(1, #list)
        return list[selection]
    else
        print(Config.ErrorCodes['dev'], Config.ErrorCodes['001'], tostring(askedEvent))
        return
    end
end

-- 3D Text Functionality
function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry('STRING')
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

-- Menu inputs
function jobMainMenu(headerName, options)
    local menu = {}
    if Config.NHMenu or Config.QBMenu then
        table.insert(menu, {
            header = headerName,
            isMenuHeader = true
        })
    end
    for i = 1, #options do
        table.insert(menu, options)
    end
    if Config.NHMenu then
        TriggerEvent("nh-context:createMenu", menu)
    elseif Config.QBMenu then
        TriggerEvent("qb-menu:client:openMenu", menu)
    elseif Config.OXLib then
        lib.registerContext({
            id = headerName,
            options = menu,
            title = headerName,
            position = 'top-right',
        }, function(selected, scrollIndex, args)
        end)
        lib.showContext(headerName)
    end 
end

RegisterNetEvent('angelicxs-CivilianJobs:Main:ResetJobs')
AddEventHandler('angelicxs-CivilianJobs:Main:ResetJobs', function()
    if DoesBlipExist(MissionRoute) then
        RemoveBlip(MissionRoute)
        MissionRoute = {}
    end
    if MissionVehicle ~= nil then
        SetVehicleDoorsLockedForAllPlayers(MissionVehicle, false)
        SetEntityAsMissionEntity(MissionVehicle, false, false)
        DeleteEntity(MissionVehicle)
        MissionVehicle = nil
    end
end)

function jobMainMenu(headerName, options)
    local menu = {}
    if Config.NHMenu or Config.QBMenu then
        table.insert(menu, {
            header = headerName,
            isMenuHeader = true
        })
    end
    for k,v in pairs(options) do 
        table.insert(menu, v)
    end
    if Config.NHMenu then
        TriggerEvent("nh-context:createMenu", menu)
    elseif Config.QBMenu then
        TriggerEvent("qb-menu:client:openMenu", menu)
    elseif Config.OXLib then
        lib.registerContext({
            id = headerName,
            options = menu,
            title = headerName,
            position = 'top-right',
        }, function(selected, scrollIndex, args)
        end)
        lib.showContext(headerName)
    end 
end

AddEventHandler('onResourceStart', function(resource)
    local partB = 'ngelicxs-CivilianJobs'
    local name = tostring('a'..partB)
    if GetCurrentResourceName() == resource and GetCurrentResourceName() ~= name then
        print('Your civilian job script was brought to you by A'..'ngelicXS! However, the resource name has been changed. Thank you for using this resource and consider renaming it to help support scripts like it.')
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if GetCurrentResourceName() == resource then
        TriggerEvent('angelicxs-CivilianJobs:Main:ResetJobs')
        if DoesBlipExist(MissionRoute) then
            RemoveBlip(MissionRoute)
            MissionRoute = {}
        end
        if DoesEntityExist(NPC) then
            DeleteEntity(NPC)
        end
        if MissionVehicle ~= nil then
            SetVehicleDoorsLockedForAllPlayers(MissionVehicle, false)
            SetEntityAsMissionEntity(MissionVehicle, false, false)
            MissionVehicle = nil
        end
    end
end)
