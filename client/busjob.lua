----------------------------------------------------------------------
--						Bus Configuration Options					--
--			 The following options can be changed to make your      --
--			  bus job unique and suit your server           		--
----------------------------------------------------------------------

local Bus_Options = {
    Sprite = {
        icon = 513,
        colour = 12,
        name = 'Angelic Bus Terminal',
    },
    Boss = {
        Location = vector4(454.06, -622.56, 28.51, 251.65),
        Model = 'u_m_y_proldriver_01',
    },
    Payment = { -- Pays on drop off of NPC
        flatRate = false,
        flatRateAmount = 100,
        DistanceMultiplier = 0.2, -- Only applies if flatRate = false, pays driver based on multiplying distance from pick up to drop off.
        materialGain = true, -- if true will give every item in the materialList to the player
        materialList = { -- List of items to give to play when they RECEIVE PAYMENT
            {name = 'rubber', min = 1, max = 2},
            {name = 'plastic', min = 1, max = 2},
            {name = 'metalscrap', min = 1, max = 2},
            {name = 'copper', min = 1, max = 2},
            {name = 'iron', min = 1, max = 2},
            {name = 'steel', min = 1, max = 2},
        },
    },
    Bus = {
        Types = {
            'bus',
        },
        Spawn = {
            vector4(463.03, -614.61, 28.5, 215.97),
            vector4(461.93, -628.29, 28.5, 215.96),
            vector4(459.14, -641.05, 28.5, 215.46),
        },
        RouteNames = {
            'Route10',
            'Route21',
            'Route45',
        },
        Routes = { -- All locations are where the NPC would stand for the bus - routes are loosley based off this: https://oyster.ignimgs.com/mediawiki/apis.ign.com/grand-theft-auto-5/2/25/Buses.jpg
            ['Route10'] = {
                vector4(303.53, -766.33, 29.31, 247.1),
                vector4(264.42, -1213.14, 29.4, 183.4),
                vector4(25.38, -1354.62, 29.34, 178.19),
                vector4(-491.41, -1294.74, 27.23, 75.57), 
                vector4(-523.75, -1025.82, 22.84, 83.65),
                vector4(-529.46, -718.97, 33.08, 137.54),
                vector4(-504.14, -671.27, 33.09, 3.76),
                vector4(-119.96, -313.5, 39.21, 63.21),
                vector4(55.98, -231.11, 50.45, 67.66), 
                vector4(404.53, -304.59, 51.42, 338.33),
                vector4(244.79, -582.04, 43.22, 244.21),
                vector4(221.93, -855.83, 30.2, 335.89),
            },
            ['Route21'] = {
                vector4(399.54, -805.7, 29.29, 265.71),
                vector4(114.57, -780.98, 31.41, 147.72),
                vector4(-509.85, -645.99, 33.14, 185.41),
                vector4(-1011.6, -307.85, 37.87, 118.21),
                vector4(-1190.37, -337.7, 37.42, 249.9),
                vector4(-503.75, -671.06, 33.08, 352.21),
                vector4(83.43, -802.18, 31.52, 333.73),
                vector4(413.57, -777.89, 29.31, 80.37),
            },
            ['Route45'] = {
                vector4(303.53, -766.33, 29.31, 247.1),
                vector4(69.92, -1471.49, 29.29, 240.16),
                vector4(-226.08, -1793.37, 29.67, 214.71),
                vector4(-1071.45, -2566.53, 20.17, 239.76), -- LSIA 1
                vector4(-1027.37, -2736.93, 20.17, 337.3), -- LSIA 2
                vector4(-217.53, -1823.81, 30.0, 30.21),
                vector4(55.3, -1539.06, 29.32, 53.44),
                vector4(344.46, -741.74, 29.27, 74.19),
            },
        },
        DropMakerAllow = true,
        DropMarker = 0,
    },
}

local busPedOptions = {
    'a_f_m_skidrow_01',
    'a_f_m_soucentmc_01',
    'a_f_m_soucent_01',
    'a_f_m_soucent_02',
    'a_f_m_tourist_01',
    'a_f_m_trampbeac_01',
    'a_f_m_tramp_01',
    'a_f_o_genstreet_01',
    'a_f_o_indian_01',
    'a_f_o_ktown_01',
    'a_f_o_salton_01',
    'a_f_o_soucent_01',
    'a_f_o_soucent_02',
    'a_f_y_beach_01',
    'a_f_y_bevhills_01',
    'a_f_y_bevhills_02',
    'a_f_y_bevhills_03',
    'a_f_y_bevhills_04',
    'a_f_y_business_01',
    'a_f_y_business_02',
    'a_f_y_business_03',
    'a_f_y_business_04',
    'a_f_y_eastsa_01',
    'a_f_y_eastsa_02',
    'a_f_y_eastsa_03',
    'a_f_y_epsilon_01',
    'a_f_y_fitness_01',
    'a_f_y_fitness_02',
    'a_f_y_genhot_01',
    'a_f_y_golfer_01',
    'a_f_y_hiker_01',
    'a_f_y_hipster_01',
    'a_f_y_hipster_02',
    'a_f_y_hipster_03',
    'a_f_y_hipster_04',
    'a_f_y_indian_01',
    'a_f_y_juggalo_01',
    'a_f_y_runner_01',
    'a_f_y_rurmeth_01',
    'a_f_y_scdressy_01',
    'a_f_y_skater_01',
    'a_f_y_soucent_01',
    'a_f_y_soucent_02',
    'a_f_y_soucent_03',
    'a_f_y_tennis_01',
    'a_f_y_tourist_01',
    'a_f_y_tourist_02',
    'a_f_y_vinewood_01',
    'a_f_y_vinewood_02',
    'a_f_y_vinewood_03',
    'a_f_y_vinewood_04',
    'a_f_y_yoga_01',
    'g_f_y_ballas_01',
    'ig_barry',
    'ig_bestmen',
    'ig_beverly',
    'ig_car3guy1',
    'ig_car3guy2',
    'ig_casey',
    'ig_chef',
    'ig_chengsr',
    'ig_chrisformage',
    'ig_clay',
    'ig_claypain',
    'ig_cletus',
    'ig_dale',
    'ig_dreyfuss',
    'ig_fbisuit_01',
    'ig_floyd',
    'ig_groom',
    'ig_hao',
    'ig_hunter',
    'csb_prolsec',
    'ig_joeminuteman',
    'ig_josef',
    'ig_josh',
    'ig_lamardavis',
    'ig_lazlow',
    'ig_lestercrest',
    'ig_lifeinvad_01',
    'ig_lifeinvad_02',
    'ig_manuel',
    'ig_milton',
    'ig_mrk',
    'ig_nervousron',
    'ig_nigel',
    'ig_old_man1a',
    'ig_old_man2',
    'ig_oneil',
    'ig_orleans',
    'ig_ortega',
    'ig_paper',
    'ig_priest',
    'ig_prolsec_02',
    'ig_ramp_gang',
    'ig_ramp_hic',
    'ig_ramp_hipster',
    'ig_ramp_mex',
    'ig_roccopelosi',
    'ig_russiandrunk',
    'ig_siemonyetarian',
    'ig_solomon',
    'ig_stevehains',
    'ig_stretch',
    'ig_talina',
    'ig_taocheng',
    'ig_taostranslator',
    'ig_tenniscoach',
    'ig_terry',
    'ig_tomepsilon',
    'ig_tylerdix',
    'ig_wade',
    'ig_zimbor',
    's_m_m_paramedic_01',
    'a_m_m_afriamer_01',
    'a_m_m_beach_01',
    'a_m_m_beach_02',
    'a_m_m_bevhills_01',
    'a_m_m_bevhills_02',
    'a_m_m_business_01',
    'a_m_m_eastsa_01',
    'a_m_m_eastsa_02',
    'a_m_m_farmer_01',
    'a_m_m_fatlatin_01',
    'a_m_m_genfat_01',
    'a_m_m_genfat_02',
    'a_m_m_golfer_01',
    'a_m_m_hasjew_01',
    'a_m_m_hillbilly_01',
    'a_m_m_hillbilly_02',
    'a_m_m_indian_01',
    'a_m_m_ktown_01',
    'a_m_m_malibu_01',
    'a_m_m_mexcntry_01',
    'a_m_m_mexlabor_01',
    'a_m_m_og_boss_01',
    'a_m_m_paparazzi_01',
    'a_m_m_polynesian_01',
    'a_m_m_prolhost_01',
    'a_m_m_rurmeth_01',
}

----------------------------------------------------------------------
--						    Bus Script       						--
--		It is NOT recommended to change any of the following        --
----------------------------------------------------------------------

local PedSpawned = false
local busPedSpawn = false
local busPed = false
local onBus = false
local lastStop = false
local onRoute = false

if Config.BusJobOn then 
    CreateThread(function()
        JobBlip(Bus_Options.Boss.Location, Bus_Options.Sprite.icon, Bus_Options.Sprite.colour, Bus_Options.Sprite.name)
        Job3DText(Bus_Options.Boss.Location, 'angelicxs-CivilianJobs:BusJob:AskForWork', 'angelicxs-CivilianJobs:BusJob:HowTo')
        while true do
            local Pos = GetEntityCoords(PlayerPedId())
            local BusBoss = vector3(Bus_Options.Boss.Location.x, Bus_Options.Boss.Location.y, Bus_Options.Boss.Location.z)
            local Dist = #(Pos - BusBoss)
            if Dist <= 50 and not PedSpawned then
                TriggerEvent('angelicxs-CivilianJobs:MAIN:SpawnBossNPC', Bus_Options.Boss.Model, Bus_Options.Boss.Location, 'angelicxs-CivilianJobs:BusJob:AskForWork', 'angelicxs-CivilianJobs:BusJob:HowTo', ' BusJob.lua')
                PedSpawned = true
            elseif PedSpawned and Dist > 50 then
                PedSpawned = false
            end
            Wait(2000)
        end
    end)

    RegisterNetEvent('angelicxs-CivilianJobs:BusJob:HowTo', function()
        TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['gen_how_to'], Config.LangType['info'])
        print(Config.Lang['bus_how_to'])
    end)

    RegisterNetEvent('angelicxs-CivilianJobs:BusJob:AskForWork', function()
        if FreeWork or PlayerJob == Config.BusJobName then
            if gettingMissionVehicle then TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['getting_vehicle'], Config.LangType['error']) return end
            if not MissionVehicle then
                local ChosenBus = Randomizer(Bus_Options.Bus.Types, 'angelicxs-CivilianJobs:BusJob:AskForWork')
                TriggerEvent('angelicxs-CivilianJobs:MAIN:CreateVehicle', ChosenBus, Bus_Options.Bus.Spawn, 'angelicxs-CivilianJobs:BusJob:AskForWork')
                while not DoesEntityExist(MissionVehicle) do
                    Wait(25)
                end
                TriggerEvent('angelicxs-CivilianJobs:BusJob:BeginWork')
            else
                TriggerEvent('angelicxs-CivilianJobs:BusJob:BeginWork')
            end
        else
            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['wrong_job'], Config.LangType['error'])
        end
    end)

    RegisterNetEvent('angelicxs-CivilianJobs:BusJob:BeginWork', function()
        if MissionVehicle then
            if not onRoute then
                onRoute = true
                local ChosenRouteName = Randomizer(Bus_Options.Bus.RouteNames, 'angelicxs-CivilianJobs:BusJob:BeginWork')
                while not ChosenRouteName do Wait(10) end
                local ChosenRoute = Bus_Options.Bus.Routes[ChosenRouteName]
                TriggerEvent('angelicxs-CivilianJobs:MAIN:RouteMarker', true, ChosenRoute, 'Bus Stop', 'angelicxs-CivilianJobs:BusJob:BeginWork')
                TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['bus_start'], Config.LangType['info'])
                BusRouteManager(ChosenRoute)
            else
                TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['bus_on_route'], Config.LangType['error'])
            end
        else
            print(Config.ErrorCodes['dev'], Config.ErrorCodes['007'], 'angelicxs-CivilianJobs:BusJob:BeginWork')
        end
    end)

    function BusRouteManager(route)
        busPedSpawn = false
        for i = 1, #route do
            while true do
                local sleep = 1100
                local coord = GetEntityCoords(PlayerPedId())
                local safeCoord = vector3(route[i].x, route[i].y, route[i].z)
                local dist = #(coord-safeCoord)
                if dist <= 75 and UsingMissionVehicle() then
                    sleep = 550
                    if not busPedSpawn then
                        SpawnBusPed(route[i])
                    end
                    if dist <= 25 then
                        sleep = 0
                        if Bus_Options.Bus.DropMakerAllow then
                            DrawMarker(Bus_Options.Bus.DropMarker, safeCoord.x, safeCoord.y, (safeCoord.z+2), 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 100, 200, 50, 255, true, true, 2, 0.0, false, false, false)
                        end
                        if dist <= 15 then
                            if IsVehicleStopped(MissionVehicle) then
                                FreezeEntityPosition(MissionVehicle, true)
                                if onBus then
                                    TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['bus_get_off'], Config.LangType['info'])
                                    GetOffBus(safeCoord, lastStop)
                                else
                                    TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['bus_get_on'], Config.LangType['info'])
                                    GetOnBus(safeCoord)
                                    while not IsPedInVehicle(busPed, MissionVehicle, true) do
                                        Wait(500)
                                    end
                                end
                                FreezeEntityPosition(MissionVehicle, false)
                                lastStop = safeCoord
                                break
                            end
                        end
                    end
                end
                Wait(sleep)            
            end
        end    
        onRoute = false
        TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['bus_route_complete'], Config.LangType['success'])
        if Config.ContinousMode then
            local headerName = Config.Lang['continous_mode_header']
            local options = {
                {
                    header = Config.Lang['continous_mode_yes'], -- nh / qbmenu
                    event = 'angelicxs-CivilianJobs:BusJob:BeginWork', -- nh
                    params = { -- qb menu
                        event = 'angelicxs-CivilianJobs:BusJob:BeginWork',
                    },
                    title = Config.Lang['continous_mode_yes'], -- oxlibs
                    onSelect = function() -- oxlibs
                        TriggerEvent("angelicxs-CivilianJobs:BusJob:BeginWork")
                    end,
                },
                {
                    header = Config.Lang['continous_mode_no'], -- nh / qbmenu
                    event = 'angelicxs-CivilianJobs:MAIN:NoContinueMode', -- nh
                    params = { -- qb menu
                        event = 'angelicxs-CivilianJobs:MAIN:NoContinueMode',
                    },
                    title = Config.Lang['continous_mode_no'], -- oxlibs
                    onSelect = function() -- oxlibs
                        TriggerEvent("angelicxs-CivilianJobs:MAIN:NoContinueMode")
                    end,
                },
            }
            jobMainMenu(headerName, options)
        else
            TriggerEvent('angelicxs-CivilianJobs:MAIN:RouteMarker', false, Bus_Options.Boss.Location.xyz, 'Bus Terminal', 'BusRouteManager()')
        end
    end

    function SpawnBusPed(coords)
        busPedSpawn = true
        local model = Randomizer(busPedOptions, 'SpawnBusPed()')
        local hash = HashGrabber(model)
        busPed = CreatePed(3, hash, coords.x, coords.y, (coords.z-1), coords.w, false, false)
        FreezeEntityPosition(busPed, true)
        SetEntityInvincible(busPed, true)
        SetBlockingOfNonTemporaryEvents(busPed, true)
        TaskStartScenarioInPlace(busPed,'WORLD_HUMAN_STAND_MOBILE', 0, false)
        SetModelAsNoLongerNeeded(model)
    end

    function GetOnBus(coords)
        if #(coords-GetEntityCoords(PlayerPedId())) > 15 then
            print(Config.ErrorCodes['dev'], Config.ErrorCodes['007'], 'GetOnBus()')
            return
        end
        for i = GetVehicleMaxNumberOfPassengers(MissionVehicle), 0, -1 do
            if IsVehicleSeatFree(MissionVehicle, i) then
                FreezeEntityPosition(busPed, false)
                ClearPedTasksImmediately(busPed)
                TaskEnterVehicle(busPed, MissionVehicle, -1, i, 1.0, 1, 0)
                onBus = true
                return
            end
        end
        print(Config.ErrorCodes['dev'], Config.ErrorCodes['002'], 'GetOnBus()')
    end

    function GetOffBus(inital, final)
        TaskLeaveVehicle(busPed, MissionVehicle, 0)
        local timeout = 5
        while IsPedInAnyVehicle(busPed) do 
            timeout = timeout - 1
            Wait(1000)
            if timeout < 0 then
                print("Timeout exceeded releasing position")
                break
            end
        end
        if Bus_Options.Payment.flatRate then
            PaymentFlat(Bus_Options.Payment.flatRateAmount, 'Bus Job - GetOffBus()')
        else
            DistancePayment(inital, final, 'Bus Job - GetOffBus()', Bus_Options.Payment.DistanceMultiplier)
        end
        if Bus_Options.Payment.materialGain then
            for i = 1, #Bus_Options.Payment.materialList do
                PaymentItemMaterial(Bus_Options.Payment.materialList[i], 'Bus Job - GetOffBus()')
            end
        end
        SetEntityAsNoLongerNeeded(busPed)
        onBus = false
        busPed = nil
        busPedSpawn = false
    end

    AddEventHandler('angelicxs-CivilianJobs:Main:ResetJobs', function()
        if DoesEntityExist(busPed) then
            DeleteEntity(busPed)
        end
        onBus = false
        busPed = nil
        busPedSpawn = false
        onRoute = false
        lastStop = false
    end)
end
