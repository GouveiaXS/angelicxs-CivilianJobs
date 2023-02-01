----------------------------------------------------------------------
--				Garbage Configuration Options			    		--
--			 The following options can be changed to make your      --
--			  Garbage job unique and suit your server        		--
----------------------------------------------------------------------

local Garbage_Options = {
    Boss = {
        Location = vector4(-319.23, -1545.41, 27.8, 327.55),
        Model = 's_m_y_garbage',
    },
    Sprite = {
        icon = 318,
        colour = 12,
        name = 'Angelic Trash Management',
    },
    Truck = {
        Spawn = vector4(-320.69, -1527.13, 27.55, 274.8),
        Type = {
            'trash',
            'trash2',
        }
    },
    Payment = {
        flatRate = false,
        flatRateAmount = 100,
        DistanceMultiplier = 1, -- Only applies if flatRate = false, pays driver based on multiplying distance from pick up to drop off.
        itemList = {
            {name = 'rubber', min = 1, max = 2},
            {name = 'metalscrap', min = 1, max = 2},
        },
    },
    SearchGarbage = true,
    Objects = {
        -1096777189,
        666561306,
        1437508529,
        -1426008804,
        -228596739,
        651101403,
        -58485588,
        218085040,
    },
}

local garbagejobOptions = {
    AllowMarker = true,
    LocationMarker = 3,
    Location = {
        vector3(114.83,-1462.31, 29.29508),
        vector3(-6.04,-1566.23, 29.209197),
        vector3(-1.88,-1729.55, 29.300233),
        vector3(159.09,-1816.69, 27.91234),
        vector3(358.94,-1805.07, 28.96659),
        vector3(481.36,-1274.82, 29.64475),
        vector3(127.9472,-1057.73, 29.19237),
        vector3(-1613.123, -509.06, 34.99874),
        vector3(342.78,-1036.47, 29.19420),
        vector3(383.03,-903.60, 29.15601), 
        vector3(165.44,-1074.68, 28.90792), 
        vector3(50.42,-1047.98, 29.31497), 
        vector3(-1463.92, -623.96, 30.20619),
        vector3(443.96,-574.33, 28.49450),
        vector3(-1255.41,-1286.82,3.58411), 
        vector3(-1229.35, -1221.41, 6.44954),
        vector3(-31.94,-93.43, 57.24907),
        vector3(274.31,-164.43, 60.35734),
        vector3(-364.33,-1864.71, 20.24249), 
        vector3(-1239.42, -1401.13, 3.75217),
    },
}

----------------------------------------------------------------------
--						 Garbage Script       					    --
--		It is NOT recommended to change any of the following        --
----------------------------------------------------------------------

local PedSpawned = false
local garbageOnJob = false
local garbagebag = nil
local searched = {}
local searching = false
local assignedRoute = {}
local totaldist = 0


if Config.GarbageJobOn then
    CreateThread(function()
        JobBlip(Garbage_Options.Boss.Location, Garbage_Options.Sprite.icon, Garbage_Options.Sprite.colour, Garbage_Options.Sprite.name)
        Job3DText(Garbage_Options.Boss.Location, 'angelicxs-CivilianJobs:GarbageJob:AskForWork', 'angelicxs-CivilianJobs:GarbageJob:HowTo')
        while true do
            local Pos = GetEntityCoords(PlayerPedId())
            local GarbageBoss = vector3(Garbage_Options.Boss.Location.x, Garbage_Options.Boss.Location.y, Garbage_Options.Boss.Location.z)
            local Dist = #(Pos - GarbageBoss)
            if Dist <= 50 and not PedSpawned then
                TriggerEvent('angelicxs-CivilianJobs:MAIN:SpawnBossNPC', Garbage_Options.Boss.Model, Garbage_Options.Boss.Location, 'angelicxs-CivilianJobs:GarbageJob:AskForWork', 'angelicxs-CivilianJobs:GarbageJob:HowTo', ' GarbageJob.lua')
                PedSpawned = true
            elseif PedSpawned and Dist > 50 then
                PedSpawned = false
            end
            Wait(2000)
        end
    end)

    RegisterNetEvent('angelicxs-CivilianJobs:GarbageJob:HowTo', function()
        TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['gen_how_to'], Config.LangType['info'])
        print(Config.Lang['garbage_how_to'])
    end)

    RegisterNetEvent('angelicxs-CivilianJobs:GarbageJob:AskForWork', function()
        if FreeWork or PlayerJob == Config.GarbageJobName then
            if not MissionVehicle then
                local ChosenVehicle = Randomizer(Garbage_Options.Truck.Type, 'angelicxs-CivilianJobs:GarbageJob:AskForWork')
                TriggerEvent('angelicxs-CivilianJobs:MAIN:CreateVehicle', ChosenVehicle, Garbage_Options.Truck.Spawn, 'angelicxs-CivilianJobs:GarbageJob:AskForWork')
                while not DoesEntityExist(MissionVehicle) do
                    Wait(25)
                end
                TriggerEvent('angelicxs-CivilianJobs:GarbageJob:BeginWork')
            else
                TriggerEvent('angelicxs-CivilianJobs:GarbageJob:BeginWork')
            end
        else
            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['wrong_job'], Config.LangType['error'])
        end
    end)

    RegisterNetEvent('angelicxs-CivilianJobs:GarbageJob:BeginWork', function()
        if not garbageOnJob then
            garbageOnJob = true
            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['garbage_start'], Config.LangType['info'])
            local assigned = GarbageRouteMaker()
            while not assigned do Wait(25) end
            GarbageRouteManager()
        else
            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['garbage_on_job'], Config.LangType['error'])
        end
    end)

    if Garbage_Options.SearchGarbage then
        if Config.UseThirdEye then
            CreateThread(function()
                if Config.ThirdEyeName == 'ox_target' then
                    local ox_options = {
                        {
                            name = 'SearchGarbageBin',
                            onSelect = function()
                                ThirdEyeGarbageSearch()
                            end,
                            label = Config.Lang['garbage_search_bin'],
                            canInteract = function(entity)
                                if searching then return false else
                                    return not searched[entity]
                                end
                            end,
                        },
                    }
                    exports.ox_target:addModel(Garbage_Options.Objects, ox_options)
                else
                    exports[Config.ThirdEyeName]:AddTargetModel(Garbage_Options.Objects, {
                        options = {
                            {
                                action = function()
                                    ThirdEyeGarbageSearch()
                                end,
                                label = Config.Lang['garbage_search_bin'],
                                canInteract = function(entity)
                                    if searching then return false else
                                        return not searched[entity]
                                    end
                                end,
                            },                                       
                        },
                        distance = 2
                    })   
                end 
            end)
            function ThirdEyeGarbageSearch()
                local pos = GetEntityCoords(PlayerPedId())
                for i=1, #Garbage_Options.Objects do
                    local garbage = GetClosestObjectOfType(pos, 10.5, Garbage_Options.Objects[i], false, false, false)
                    if not searched[garbage] then
                        searched[garbage] = true
                        searching = true
                        SearchGarbage()
                        break
                    end
                end
            end
        end
        if Config.Use3DText then
            CreateThread(function()
                while Garbage_Options.SearchGarbage do
                    local sleep = 1200
                    local ped = PlayerPedId()
                    local inVehicle = IsPedInAnyVehicle(ped, false)
                    if not inVehicle then
                        local pos = GetEntityCoords(ped)
                        for i=1, #Garbage_Options.Objects do
                            local garbage = GetClosestObjectOfType(pos, 10.5, Garbage_Options.Objects[i], false, false, false)
                            local propPos = GetEntityCoords(garbage)
                            local dist = #(pos-propPos)
                            if dist <= 10 and not searched[garbage] then
                                sleep = 0
                                if dist <= 3 then
                                    DrawText3Ds(propPos.x, propPos.y, propPos.z, Config.Lang['garbage_search_bin_3D'])
                                    if IsControlJustReleased(0, 38) and not searching then
                                        searched[garbage] = true
                                        searching = true
                                        SearchGarbage()
                                    end 
                                end
                            end
                        end
                    end
                    Wait(sleep)
                end
            end)
        end
    end

    function GarbageRouteMaker()
        local init = vector3(Garbage_Options.Truck.Spawn.x, Garbage_Options.Truck.Spawn.y, Garbage_Options.Truck.Spawn.z)
        local previousLocation = init
        for i =1, #garbagejobOptions.Location do
            local spot = garbagejobOptions.Location[i]
            local routeAdd = math.random(1,3) -- 33% to add route to route
            if routeAdd == 1 then
                table.insert(assignedRoute, spot)
                local dist = #(previousLocation-spot)
                previousLocation = spot
                totaldist = totaldist + math.floor(dist)
            end
        end
        return true
    end
    
    function GarbageRouteManager()
        local bag = false
        local routenumber = 0
        for i = 1, #assignedRoute do
            if not garbageOnJob then return end
            routenumber = routenumber + 1
            TriggerEvent('angelicxs-CivilianJobs:MAIN:RouteMarker', false, assignedRoute[i], 'Garbage Location', 'GarbageRouteManager()')
            while true do
                local sleep = 1100
                local ped = PlayerPedId()
                local coord = GetEntityCoords(ped)
                local dist = #(coord-assignedRoute[i])
                local inVehicle = IsPedInAnyVehicle(ped, false)
                if dist <= 50 then
                    sleep = 500
                    if dist <= 25 then
                        sleep = 0
                        if garbagejobOptions.AllowMarker then
                            DrawMarker(garbagejobOptions.LocationMarker, assignedRoute[i].x, assignedRoute[i].y, (assignedRoute[i].z+2), 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 100, 200, 50, 255, true, true, 2, 0.0, false, false, false)
                        end
                        if not garbagebag then 
                            if dist <= 5 then
                                if not inVehicle then 
                                    DrawText3Ds(assignedRoute[i].x, assignedRoute[i].y, assignedRoute[i].z, Config.Lang['garbage_get_garbage'])
                                    if IsControlJustReleased(0,47) then
                                        GetGarbage()
                                    end
                                end
                            end
                        else
                            local vehiclecoords = GetOffsetFromEntityInWorldCoords(MissionVehicle, 0.0, -4.5, 0.0)
                            local vDist = #(coord-vehiclecoords)
                            if vDist <= 5 then
                                DrawText3Ds(vehiclecoords[i].x, vehiclecoords[i].y, vehiclecoords[i].z, Config.Lang['garbage_put_garbage'])
                                if IsControlJustReleased(0,47) then
                                    PutGarbage()
                                    break
                                end
                            end
                        end
                    end
                end
                Wait(sleep)            
            end
        end    
        TriggerEvent('angelicxs-CivilianJobs:MAIN:RouteMarker', false, vector3(Garbage_Options.Truck.Spawn.x, Garbage_Options.Truck.Spawn.y, Garbage_Options.Truck.Spawn.z), 'Garbage Terminal', 'GarbageRouteManager()')
        TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['garbage_route_complete'], Config.LangType['success'])
        if Garbage_Options.Payment.flatRate then
            local p = math.floor(routenumber * Garbage_Options.Payment.flatRateAmount)
            PaymentFlat(p, 'Garbage Job - GarbageRouteManager()')
        else
            DistancePayment(0, totaldist, 'Garbage Job - GarbageRouteManager()', Garbage_Options.Payment.DistanceMultiplier)
        end
        garbageOnJob = false
        totaldist = 0
        assignedRoute = {}
    end
    
    function GetGarbage()
        local ped = PlayerPedId()
        local bag = HashGrabber('prop_cs_rub_binbag_01')
        FreezeEntityPosition(ped, true)
        LoadAnim('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
        LoadAnim('missfbi4prepp1')
        TaskPlayAnim(ped,"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer",1.0, -1.0, -1, 49, 0, 0, 0, 0)
        Wait(math.random(1000,5000))
        FreezeEntityPosition(ped, false)
        ClearPedTasks(ped)
        garbagebag = CreateObject(bag, 0, 0, 0, true, true, true)
        TaskPlayAnim(ped, 'missfbi4prepp1', '_bag_walk_garbage_man', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
        AttachEntityToEntity(garbagebag, ped, GetPedBoneIndex(ped, 57005), 0.12, 0.0, -0.05, 220.0, 120.0, 0.0, true, true, false, true, 1, true)
        CreateThread(function()
            while garbagebag do
                local player = PlayerPedId()
                if IsEntityPlayingAnim(ped, 'missfbi4prepp1', '_bag_throw_garbage_man',3) then
                elseif not IsEntityPlayingAnim(ped, 'missfbi4prepp1', '_bag_walk_garbage_man',3) then
                    ClearPedTasks(ped)
                    TaskPlayAnim(ped, 'missfbi4prepp1', '_bag_walk_garbage_man', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
                end
                Wait(0)
            end
            RemoveAnimDict("missfbi4prepp1")
            RemoveAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
        end)
    end
    
    function PutGarbage()
        local ped = PlayerPedId()
        LoadAnim('missfbi4prepp1')
        TaskPlayAnim(ped, 'missfbi4prepp1', '_bag_throw_garbage_man', 8.0, 8.0, 1100, 48, 0.0, 0, 0, 0)
        FreezeEntityPosition(ped, true)
        SetEntityHeading(ped, GetEntityHeading(MissionVehicle))
        Wait(1250)
        DetachEntity(garbagebag, 1, false)
        DeleteObject(garbagebag)
        TaskPlayAnim(ped, 'missfbi4prepp1', 'exit', 8.0, 8.0, 1100, 48, 0.0, 0, 0, 0)
        garbagebag = nil
        FreezeEntityPosition(ped, false)
        RemoveAnimDict("missfbi4prepp1")
    end

    function SearchGarbage()
        local ped = PlayerPedId()
        FreezeEntityPosition(ped, true)
        LoadAnim('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
        TaskPlayAnim(ped,"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer",1.0, -1.0, -1, 49, 0, 0, 0, 0)
        Wait(math.random(1000,5000))
        local getItem = math.random(1,3) -- 33% to actually find item
        if getItem == 1 then
            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['garbage_item_find'], Config.LangType['success'])
            local item = Randomizer(Garbage_Options.Payment.itemList, 'angelicxs-CivilianJobs:GarbageJob:SearchGarbage()')
            while not item do Wait(10) end
            PaymentItem(item, 'Garbage Job Searching Bin - angelicxs-CivilianJobs:GarbageJob:SearchGarbage()')
        else        
            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['garbage_item_nofind'], Config.LangType['info'])
        end
        FreezeEntityPosition(ped, false)
        ClearPedTasks(ped)
        RemoveAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
        Wait(1000)
        searching = false
    end

    AddEventHandler('angelicxs-CivilianJobs:Main:ResetJobs', function()
        if DoesEntityExist(garbagebag) then
            RemoveAnimDict("missfbi4prepp1")
            RemoveAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
            local ped = PlayerPedId()
            DetachEntity(garbagebag, 1, false)
            DeleteObject(garbagebag)
            ClearPedTasks(ped)
        end
        PedSpawned = false
        garbageOnJob = false
        garbagebag = nil
        searched = {}
        searching = false
        assignedRoute = {}
        totaldist = 0
    end)
end