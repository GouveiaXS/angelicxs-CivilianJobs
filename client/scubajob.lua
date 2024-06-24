----------------------------------------------------------------------
--				Scuba Diving Configuration Options					--
--			 The following options can be changed to make your      --
--			  scub job unique and suit your server            		--
----------------------------------------------------------------------
local ChosenBoat = false
local Scuba_Options = {
    AnchorBoatCommand = true,
    AnchorBoatWord = 'anchorboat',
    Boss = {
        Location = vector4(-775.8531, -1433.42, 1.595219, 288.6797),
        Model = 's_m_m_dockwork_01',
    },
    Sprite = {
        icon = 729,
        colour = 12,
        name = 'UnderSea Group',
    },
    Boat = {
        Spawn = vector4(-776.09, -1429.82, -0.47, 134.08),
        Type = {
            'dinghy',
        }
    },
    UnderwaterTimer = 420, -- In seconds
    Payment = {
        flatRate = true,
        flatRateAmount = 1500,
        items = true,
        itemList = {
            {name = 'rubber', min = 2, max = 8},
            {name = 'plastic', min = 4, max = 8},
            {name = 'copper', min = 5, max = 8},
        }
    },
}

local crateOptions = {
    CrateAllowMarker = true,
    CrateLocationMarker = 0,
    Location = {
        [1] = {
            vector3(-3403.57, 3710.78, -80.62),    vector3(-3385.58, 3710.43, -84.82),    vector3(-3365.83, 3716.45, -91.2),    vector3(-3345.63, 3714.8, -95.78),
            vector3(-3328.87, 3698.88, -96.71),    vector3(-3389.9, 3723.14, -86.58),    vector3(-3410.39, 3739.28, -79.52),
        },        
        [2] = {
            vector3(-3177.29, 3017.18, -37.79),    vector3(-3185.25, 3033.48, -38.29),    vector3(-3188.14, 3053.65, -38.19),    vector3(-3177.3, 3051.5, -38.32),
            vector3(-3173.12, 3041.8, -35.82),    vector3(-3165.79, 3008.71, -36.63),    vector3(-3164.02, 3050.48, -32.3),
        },        
        [3] = {
            vector3(-916.26, 6645.24, -25.98),    vector3(-902.3, 6632.37, -26.21),    vector3(-916.27, 6607.53, -27.51),    vector3(-872.48, 6602.5, -28.32),
            vector3(-849.78, 6649.24, -21.39),    vector3(-884.39, 6676.81, -25.79),    vector3(-932.11, 6699.05, -32.51),
        },
        [4] = {
            vector3(-2836.73, -462.16, -13.58),    vector3(-2861.99, -439.92, -24.11),    vector3(-2814.28, -377.3, -30.91),    vector3(-2798.08, -429.93, -35.3),
            vector3(-2819.59, -470.73, -44.73),    vector3(-2826.6, -519.13, -56.44),    vector3(-2820.72, -610.41, -50.37),
        },        
        [5] = {
            vector3(3280.17, 6416.57, -41.91),    vector3(3233.12, 6414.51, -37.22),    vector3(3260.18, 6376.98, -25.44),    vector3(3309.99, 6430.98, -44.49),
            vector3(3278.15, 6484.98, -43.11),    vector3(3226.95, 6485.53, -39.96),    vector3(3193.43, 6470.45, -32.13),
        },        
        [6] = {
            vector3(3415.53, 6315.46, -50.37),    vector3(3393.36, 6338.17, -50.35),    vector3(3412.38, 6353.98, -55.79),    vector3(3420.1, 6294.81, -47.69),
            vector3(3385.09, 6282.62, -36.32),    vector3(3376.03, 6306.77, -41.48),    vector3(3378.73, 6342.12, -51.32),
        },        
        [7] = {
            vector3(3893.63, 3058.47, -22.01),    vector3(3918.02, 3053.14, -22.01),    vector3(3919.13, 3019.82, -29.72),    vector3(3890.67, 3021.22, -28.54),
            vector3(3900.92, 3046.54, -19.08),    vector3(3948.11, 3026.81, -35.26),    vector3(3861.16, 3097.67, -15.15),
        },        
        [8] = {
            vector3(3159.35, -338.84, -20.66),    vector3(3144.81, -301.69, -18.46),    vector3(3140.34, -252.11, -18.13),    vector3(3176.05, -243.94, -18.22),
            vector3(3179.15, -288.49, -9.12),    vector3(3218.42, -373.04, -27.45),    vector3(3243.52, -417.78, -39.43),
        },        
        [9] = {
            vector3(2680.07, -1431.97, -17.49),     vector3(2713.14, -1411.52, -16.71),    vector3(2711.46, -1370.75, -14.39),    vector3(2681.32, -1353.71, -19.23),
            vector3(2655.77, -1368.25, -17.62),    vector3(2628.66, -1384.49, -12.94),    vector3(2646.28, -1446.14, -17.85)
        },        
        [10] = {
            vector3(1751.09, -2983.05, -45.31),    vector3(1717.58, -3024.75, -51.43),    vector3(1759.41, -3057.78, -48.64),    vector3(1808.51, -3076.38, -40.33),
            vector3(1848.39, -3049.72, -39.06),    vector3(1837.9, -3000.39, -44.2),    vector3(1861.03, -2924.65, -37.03)
        },
    },
    Style = {
        'prop_drop_armscrate_01',
        'prop_drop_armscrate_01b',
    },
}

----------------------------------------------------------------------
--						 Scuba Diving Script       					--
--		It is NOT recommended to change any of the following        --
----------------------------------------------------------------------

local PedSpawned = false
local Region = nil
local CrateTable = {}
local ScubaMode = false
local ScubaMask = false
local ScubaTank = false
local Timer = 0
local anchor = false
local anchoredboat = nil
local RegionCheck = false

if Config.ScubaJobOn then
    if Scuba_Options.AnchorBoatCommand then
        RegisterCommand(Scuba_Options.AnchorBoatWord, function()
            local ped = PlayerPedId()
            if IsPedInAnyBoat(ped) then
                local vehicle = GetVehiclePedIsIn(ped, false)
                if GetPedInVehicleSeat(vehicle, -1) == ped then
                    if anchoredboat then
                        FreezeEntityPosition(anchoredboat, false)
                        TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['gen_anchor_boat_off'], Config.LangType['success'])
                        anchoredboat = nil
                    else
                        anchoredboat = vehicle
                        FreezeEntityPosition(anchoredboat, true)
                        TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['gen_anchor_boat_on'], Config.LangType['success'])
                    end
                else
                    TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['gen_anchor_boat_activate'], Config.LangType['info'])
                end
            else
                TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['gen_anchor_boat'], Config.LangType['error'])
            end
        end, false)
    end

    CreateThread(function()
        JobBlip(Scuba_Options.Boss.Location, Scuba_Options.Sprite.icon, Scuba_Options.Sprite.colour, Scuba_Options.Sprite.name)
        Job3DText(Scuba_Options.Boss.Location, 'angelicxs-CivilianJobs:ScubaJob:AskForWork', 'angelicxs-CivilianJobs:ScubaJob:HowTo')
        while true do
            local Pos = GetEntityCoords(PlayerPedId())
            local ScubaBoss = vector3(Scuba_Options.Boss.Location.x, Scuba_Options.Boss.Location.y, Scuba_Options.Boss.Location.z)
            local Dist = #(Pos - ScubaBoss)
            if Dist <= 50 and not PedSpawned then
                TriggerEvent('angelicxs-CivilianJobs:MAIN:SpawnBossNPC', Scuba_Options.Boss.Model, Scuba_Options.Boss.Location, 'angelicxs-CivilianJobs:ScubaJob:AskForWork', 'angelicxs-CivilianJobs:ScubaJob:HowTo', ' ScubaJob.lua')
                PedSpawned = true
            elseif PedSpawned and Dist > 50 then
                PedSpawned = false
            end
            Wait(2000)
        end
    end)

    RegisterNetEvent('angelicxs-CivilianJobs:ScubaJob:HowTo', function()
        TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['gen_how_to'], Config.LangType['info'])
        print(Config.Lang['scuba_how_to'])
    end)

    RegisterNetEvent('angelicxs-CivilianJobs:Main:ResetJobs', function()
        ChosenBoat = false
    end)

    RegisterNetEvent('angelicxs-CivilianJobs:ScubaJob:AskForWork', function()
        if FreeWork or PlayerJob == Config.ScubaJobName then
            if not MissionVehicle then
                ChosenBoat = Randomizer(Scuba_Options.Boat.Type, 'angelicxs-CivilianJobs:JetskiJob:AskForWork')
                while not ChosenBoat do Wait(10) end
                TriggerEvent('angelicxs-CivilianJobs:MAIN:CreateVehicle', ChosenBoat, Scuba_Options.Boat.Spawn, 'angelicxs-CivilianJobs:ScubaJob:AskForWork')
                while not DoesEntityExist(MissionVehicle) do
                    Wait(25)
                end
                TriggerEvent('angelicxs-CivilianJobs:ScubaJob:BeginWork')
            elseif GetEntityModel(MissionVehicle) ~= GetHashKey(ChosenBoat) then
                TriggerEvent('angelicxs-CivilianJobs:Notify', "You must have the proper work vehicle to do this kind of job!", Config.LangType['error'])
            else
                TriggerEvent('angelicxs-CivilianJobs:ScubaJob:BeginWork')
            end
        else
            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['wrong_job'], Config.LangType['error'])
        end
    end)

    RegisterNetEvent('angelicxs-CivilianJobs:ScubaJob:BeginWork', function()
        if Region == nil then
            Region = Randomizer(crateOptions.Location, 'angelicxs-CivilianJobs:ScubaJob:BeginWork')
            RegionCheck = true
            local area = nil
            local amount = 0
            while Region == nil do Wait(10) end
            for i = 1, #Region do
                if i == 1 then
                    area = Region[i]
                end
                CreateThread(function()
                    local spot = Region[i]
                    while true and RegionCheck do -- Waits until player is close to spawn items
                        if #(GetEntityCoords(PlayerPedId()) - spot) <= 120 then break end
                        Wait(0)
                    end
                    if not RegionCheck then return end
                    Wait(i*250)
                    local crateType = Randomizer(crateOptions.Style, 'angelicxs-CivilianJobs:ScubaJob:BeginWork')
                    while not crateType do Wait(10) end
                    local hash = HashGrabber(crateType)
                    while not hash do Wait(10) end
                    local crateItem = CreateObject(hash, spot.x, spot.y, spot.z, true, true, true)
                    SetEntityAsMissionEntity(crateItem, true, true)
                    FreezeEntityPosition(crateItem, true)
                    CrateMarker(spot, crateItem)
                    CrateInteract(spot, crateItem, crateType)
                    SetModelAsNoLongerNeeded(crateType)
                    table.insert(CrateTable, crateItem)
                end)
                amount = i
            end
            TriggerEvent('angelicxs-CivilianJobs:MAIN:RouteMarker', false, area, 'Scuba Diving Area', 'angelicxs-CivilianJobs:ScubaJob:BeginWork')
            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['scuba_start']..' '..tostring(amount), Config.LangType['info'])
        else
            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['scuba_on_job'], Config.LangType['error'])
        end

    end)


    function CrateMarker(spot, crateItem)
        if crateOptions.CrateAllowMarker then
            CreateThread(function()
                while true do 
                    local sleep = 1000
                    local coord = GetEntityCoords(PlayerPedId())
                    if #(coord-spot) < 40 then
                        sleep = 0
                        DrawMarker(crateOptions.CrateLocationMarker, spot.x, spot.y, (spot.z+2), 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 100, 200, 50, 255, true, true, 2, 0.0, false, false, false)
                        if not DoesEntityExist(crateItem) then 
                            break
                        end
                    end
                    Wait(sleep)
                end
            end)
        end
    end

    function CrateInteract(spot, crateItem, crateType)
        if Config.UseThirdEye then
            if Config.ThirdEyeName == 'ox_target' then
                local ox_optionsScuba = {
                    {
                        name = 'ScubaGrabCrate',
                        label = Config.Lang['scuba_salvage'],
                        onSelect = function()
                            TriggerEvent('angelicxs-CivilianJobs:ScubaJob:SalvageCrate', crateItem, crateType)
                        end
                    },
                }
                exports.ox_target:addLocalEntity(crateItem, ox_optionsScuba)
            else
                exports[Config.ThirdEyeName]:AddEntityZone(tostring(crateItem), crateItem, {
                    name = tostring(crateItem),
                    debugPoly=false,
                    useZ = true,
                    }, {
                    options = {
                        {
                            label = Config.Lang['scuba_salvage'],
                            action = function()
                                TriggerEvent('angelicxs-CivilianJobs:ScubaJob:SalvageCrate', crateItem, crateType)
                                exports[Config.ThirdEyeName]:RemoveZone(tostring(crateItem))
                            end,
                        },                               
                    },
                    distance = 2
                })       
            end 
        end
        if Config.Use3DText then
            CreateThread(function()
                while true do 
                    local sleep = 1000
                    local coord = GetEntityCoords(PlayerPedId())
                    if #(coord-spot) < 20 then
                        sleep = 0
                        if #(coord-spot) < 5 then
                            DrawText3Ds(spot.x,spot.y,spot.z, Config.Lang['scuba_salvage_3d'])
                            if IsControlJustReleased(0, 38) then
                                TriggerEvent('angelicxs-CivilianJobs:ScubaJob:SalvageCrate', crateItem, crateType)
                                break
                            end
                        end
                    end
                    Wait(sleep)
                end
            end)
        end
    end

    RegisterNetEvent('angelicxs-CivilianJobs:ScubaJob:SalvageCrate', function(crate, type)
        local ped = PlayerPedId()
        local object = nil
        if DoesEntityExist(crate) then
            object = crate
        else
            local closestObject = GetClosestObjectOfType(GetEntityCoords(ped), 5.5, GetHashKey(type), false)
            if DoesEntityExist(closestObject) then
                object = closestObject
            end
        end
        if object then
            TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_WELDING', 0, true)
            Wait(5000)
            DeleteObject(object)
            ClearPedTasks(ped)
            if Scuba_Options.Payment.flatRate then
                PaymentFlat(Scuba_Options.Payment.flatRateAmount, 'Scuba Job - angelicxs-CivilianJobs:ScubaJob:SalvageCrate')
            end
            if Scuba_Options.Payment.items then
                local item = Randomizer(Scuba_Options.Payment.itemList, 'angelicxs-CivilianJobs:ScubaJob:SalvageCrate')
                while not item do Wait(10) end
                PaymentItem(item, 'Scuba Job - angelicxs-CivilianJobs:ScubaJob:SalvageCrate')
            end
            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['scuba_salvage_complete'], Config.LangType['success'])
        end
    end)

    RegisterNetEvent('angelicxs-CivilianJobs:ScubaJob:ScubaMode', function()
        local ped = PlayerPedId()
        if not IsEntityInWater(ped) then
            scubaGearToggle()
            if ScubaMode then
                ScubaMode = false
                SetPedDiesInWater(ped, true)
                DeleteObject(ScubaMask)
                DeleteObject(ScubaTank)
            else
                ScubaMode = true
                local back = GetPedBoneIndex(ped, 24818)
                local face = GetPedBoneIndex(ped, 12844)
                local maskHash = HashGrabber('p_d_scuba_mask_s')
                local tankHash = HashGrabber('p_s_scuba_tank_s')
                ScubaMask = CreateObject(maskHash, 1.0, 1.0, 1.0, 1, 1, 0)
                ScubaTank = CreateObject(tankHash, 1.0, 1.0, 1.0, 1, 1, 0)
                AttachEntityToEntity(ScubaMask, ped, face, 0.0, 0.0, 0.0, 180.0, 90.0, 0.0, 1, 1, 0, 0, 2, 1)
                AttachEntityToEntity(ScubaTank, ped, back, -0.25, -0.25, 0.0, 180.0, 90.0, 0.0, 1, 1, 0, 0, 2, 1)
                SetEnableScuba(ped, true)
                SetPedDiesInWater(ped, false)
                UnderWaterTimer()
            end
        else
            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['scuba_in_water'], Config.LangType['error'])
        end
    end)

    function scubaGearToggle()
        RequestAnimDict("clothingshirt")
        while not HasAnimDictLoaded("clothingshirt") do
            Wait(0)
        end
        local ped = PlayerPedId()
        TaskPlayAnim(ped, "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
        Wait(3000)
        ClearPedTasks(ped)
    end

    function UnderWaterTimer()
        Timer = Scuba_Options.UnderwaterTimer
        local Quarter = math.floor(Timer/4)
        while ScubaMode do
            local ped = PlayerPedId()
            if IsPedSwimmingUnderWater(ped) then
                Timer = Timer-1
            end
            if Timer == Quarter*3 then
                TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['scuba_75'], Config.LangType['info'])
            elseif Timer == Quarter*2 then
                TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['scuba_50'], Config.LangType['info'])
            elseif Timer == Quarter then
                TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['scuba_25'], Config.LangType['info'])
            elseif Timer == 0 then
                SetPedDiesInWater(ped, true)
                SetEnableScuba(ped, false)
                SetEntityHealth(ped, 0)
                DeleteObject(ScubaMask)
                DeleteObject(ScubaTank)
                ClearPedTasks(ped)
                ScubaMode = false
                break
            end
            Wait(1000)
        end
    end

    AddEventHandler('angelicxs-CivilianJobs:Main:ResetJobs', function()
        for i = 1, #CrateTable do
            if DoesEntityExist(CrateTable[i]) then
                DeleteEntity(CrateTable[i])
            end
        end
        if ScubaMask then
            DeleteObject(ScubaMask)
        end
        if ScubaTank then
            DeleteObject(ScubaTank)
        end
        Region = nil
        ScubaMode = false
        RegionCheck = false
        CrateTable = {}
    end)
end
