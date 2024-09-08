----------------------------------------------------------------------
--						Taxi Configuration Options					--
--			 The following options can be changed to make your      --
--			  taxi job unique and suit your server           		--
----------------------------------------------------------------------

local Taxi_Options = {}

Taxi_Options.Payment = { -- Pays on drop off of NPC
    flatRate = false,
    flatRateAmount = 100,
    DistanceMultiplier = 0.4, -- Only applies if flatRate = false, pays driver based on multiplying distance from pick up to drop off.
    materialGain = true, -- if true will give every item in the materialList to the player
    materialList = { -- List of items to give to play when they RECEIVE PAYMENT
        {name = 'rubber', min = 1, max = 2},
        {name = 'plastic', min = 1, max = 2},
        {name = 'metalscrap', min = 1, max = 2},
        {name = 'copper', min = 1, max = 2},
        {name = 'iron', min = 1, max = 2},
        {name = 'steel', min = 1, max = 2},
    },
}

Taxi_Options.Boss = {
    Location = vector4(896.22, -177.72, 74.7, 232.65),
    Model = 'cs_manuel',
}

Taxi_Options.Sprite = {
    icon = 198,
    colour = 12,
    name = 'Angelic Taxi Services',
}

Taxi_Options.Taxi = {
    Types = {
        'taxi',
    },
    SpawnLocations = {
        vector4(916.45, -170.62, 74.44, 103.39),
        vector4(918.35, -167.02, 74.63, 98.34),
        vector4(921.18, -163.46, 74.86, 96.32),
        vector4(914.07, -160.41, 74.74, 197.14),
        vector4(911.35, -163.17, 74.38, 199.78),
        vector4(909.29, -183.58, 74.19, 60.71),
        vector4(907.39, -186.44, 74.03, 62.95),
        vector4(905.68, -189.32, 73.81, 56.6),
        vector4(897.4, -183.6, 73.76, 239.29),
        vector4(898.92, -180.4, 73.82, 238.54),
    },
    MinWait = 30, -- Minimum time (in seconds) between calls
    MaxWait = 90, -- Maximum time (in seconds) between calls
}

Taxi_Options.Routes = { -- All locations are where the NPC would stand for the taxi
    Start = {
        vector4(1131.52, -855.23, 53.57, 3.32),
        vector4(1231.03, -1305.17, 34.96, 257.42),
        vector4(1259.85, -1737.57, 50.02, 207.62),
        vector4(913.23, -2192.32, 30.49, 263.16),
        vector4(286.35, -2025.17, 19.34, 55.87),
        vector4(327.74, -1767.18, 28.94, 221.99),
        vector4(-83.01, -1580.73, 31.04, 320.82),
    },
    Finish = {
        vector4(-569.59, -1084.78, 22.33, 161.06),
        vector4(-239.38, -990.13, 29.29, 245.29),
        vector4(-317.79, -297.73, 30.93, 149.98),
        vector4(-78.58, 271.89, 101.15, 172.07),
        vector4(-481.53, 117.88, 63.91, 354.24),
        vector4(-1200.08, -273.57, 37.79, 254.29),
        vector4(922.03, 46.71, 81.11, 34.44),
    },
    DropMakerAllow = true,
    DropMarker = 3,
}

local taxiPedOptions = {
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

local taxiPedNames = {
    'Aubrey Lopez',
    'Tracey House',
    'Ellsworth Herrera',
    'Kasey Fry',
    'May Lucas',
    'Savannah Mack',
    'Natasha Hernandez',
    'Bart Bush',
    'Olin Bright',
    'Roxie Baxter',
    'Zachery Mitchell',
    'Stacy Orr',
    'Anton Blake',
    'Lina Cordova',
    'Valeria Novak',
    'Erika Thompson',
    'Brad Mcbride',
    'Numbers Hines',
    'Marcos Sullivan',
    'Antonia Galvan',
    'Valerie Lloyd',
    'Grady Cowan',
    'Tanya Perez',
    'Sylvester Crosby',
    'Johnathon Meyer',
    'Alberta Barry',
    'Rickie Berry',
    'Jordon Cain',
    'Junior Hays',
    'Kris Solomon',
}
----------------------------------------------------------------------
--						    Taxi Script       						--
--		It is NOT recommended to change any of the following        --
----------------------------------------------------------------------

local PedSpawned = false
local taxiPedSpawn = false
local taxiPed = false
local onRoute = false
local startWorking = false

if Config.TaxiJobOn then 
    CreateThread(function()
        JobBlip(Taxi_Options.Boss.Location, Taxi_Options.Sprite.icon, Taxi_Options.Sprite.colour, Taxi_Options.Sprite.name)
        Job3DText(Taxi_Options.Boss.Location, 'angelicxs-CivilianJobs:taxiJob:AskForWork', 'angelicxs-CivilianJobs:taxiJob:HowTo')
        while true do
            local Pos = GetEntityCoords(PlayerPedId())
            local TaxiBoss = vector3(Taxi_Options.Boss.Location.x, Taxi_Options.Boss.Location.y, Taxi_Options.Boss.Location.z)
            local Dist = #(Pos - TaxiBoss)
            if Dist <= 50 and not PedSpawned then
                TriggerEvent('angelicxs-CivilianJobs:MAIN:SpawnBossNPC', Taxi_Options.Boss.Model, Taxi_Options.Boss.Location, 'angelicxs-CivilianJobs:taxiJob:AskForWork', 'angelicxs-CivilianJobs:taxiJob:HowTo', ' taxiJob.lua')
                PedSpawned = true
            elseif PedSpawned and Dist > 50 then
                PedSpawned = false
            end
            Wait(2000)
        end
    end)

    RegisterNetEvent('angelicxs-CivilianJobs:taxiJob:HowTo', function()
        TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['gen_how_to'], Config.LangType['info'])
        print(Config.Lang['taxi_how_to'])
    end)

    RegisterNetEvent('angelicxs-CivilianJobs:taxiJob:AskForWork', function()
        if FreeWork or PlayerJob == Config.TaxiJobName then
            if gettingMissionVehicle then TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['getting_vehicle'], Config.LangType['error']) return end
            if not MissionVehicle then
                local ChosenTaxi = Randomizer(Taxi_Options.Taxi.Types, 'angelicxs-CivilianJobs:taxiJob:AskForWork')
                TriggerEvent('angelicxs-CivilianJobs:MAIN:CreateVehicle', ChosenTaxi, Taxi_Options.Taxi.SpawnLocations, 'angelicxs-CivilianJobs:taxiJob:AskForWork')
                while not DoesEntityExist(MissionVehicle) do
                    Wait(25)
                end
                TriggerEvent('angelicxs-CivilianJobs:taxiJob:BeginWork')
            else
                TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['vehicle_out'], Config.LangType['error'])
            end
        else
            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['wrong_job'], Config.LangType['error'])
        end
    end)

    RegisterNetEvent('angelicxs-CivilianJobs:taxiJob:BeginWork', function()
        if MissionVehicle then
            if not startWorking then
                TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['taxi_start'], Config.LangType['info'])
                TaxiOperator()
            else
                TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['taxi_working'], Config.LangType['error'])
            end
        else
            print(Config.ErrorCodes['dev'], Config.ErrorCodes['007'], 'angelicxs-CivilianJobs:taxiJob:BeginWork')
        end    
    end)

    function TaxiOperator()
        startWorking = true
        TaxiManager()
        while true do
            local sleep = 1000
            if not MissionVehicle then
                startWorking = false
                break
            end
            Wait(sleep)
        end
    end

    function TaxiManager()
        while true do
            while onRoute do Wait(1000) end
            local seconds = math.random(Taxi_Options.Taxi.MinWait, Taxi_Options.Taxi.MaxWait)
            Wait(seconds*1000)
            while not UsingMissionVehicle() do Wait(1500) end
            if not startWorking then break end
            if not onRoute then
                TriggerEvent('angelicxs-CivilianJobs:taxiJob:FareSelector')
            end
        end
    end

    RegisterNetEvent('angelicxs-CivilianJobs:taxiJob:FareSelector', function()
        local info = {}
        local menu = {}
        info.start = Randomizer(Taxi_Options.Routes.Start, 'angelicxs-CivilianJobs:taxiJob:FareSelector')
        info.finish = Randomizer(Taxi_Options.Routes.Finish, 'angelicxs-CivilianJobs:taxiJob:FareSelector')
        info.name = Randomizer(taxiPedNames, 'angelicxs-CivilianJobs:taxiJob:FareSelector')
        while not info.start and not info.finish and not info.name do Wait(25) end
        info.safeStart = vector3(info.start.x, info.start.y, info.start.z)
        info.safeFinish = vector3(info.finish.x, info.finish.y, info.finish.z)
        info.estimatedFare = Taxi_Options.Payment.flatRateAmount
        if not Taxi_Options.Payment.flatRate then
            info.estimatedFare = math.floor(#(info.safeStart - info.safeFinish)*Taxi_Options.Payment.DistanceMultiplier)
        end
        if Config.NHMenu then
            table.insert(menu, {
                header = Config.Lang['taxi_menu_header_1']..info.name..Config.Lang['taxi_menu_header_2']..info.estimatedFare,
            })
            table.insert(menu, {
                header = Config.Lang['taxi_menu_yes'],
                event = 'angelicxs-CivilianJobs:taxiJob:JobAccepted',
                args = { info }
            })
            table.insert(menu, {
                header = Config.Lang['taxi_menu_no'],
                event = 'angelicxs-CivilianJobs:taxiJob:JobAccepted',
            })
        elseif Config.QBMenu then
            table.insert(menu, {
                    header = Config.Lang['taxi_menu_header_1']..info.name..Config.Lang['taxi_menu_header_2']..info.estimatedFare,
                    isMenuHeader = true
                })
            table.insert(menu, {
                header = Config.Lang['taxi_menu_yes'],
                    params = {
                        event = 'angelicxs-CivilianJobs:taxiJob:JobAccepted',
                        args = info
                    }
                })
            table.insert(menu, {
                header = Config.Lang['taxi_menu_no'],
                params = {
                    event = 'angelicxs-CivilianJobs:taxiJob:JobAccepted',
                }
            })
        elseif Config.OXLib then
            table.insert(menu, {
                title = Config.Lang['taxi_menu_yes'],
                onSelect = function()
                    TriggerEvent("angelicxs-CivilianJobs:taxiJob:JobAccepted", info)
                end,
            })
            table.insert(menu, {
                title = Config.Lang['taxi_menu_no'],
                onSelect = function()
                    TriggerEvent("angelicxs-CivilianJobs:taxiJob:JobAccepted", false)
                end,
            })
        end
        if Config.NHMenu then
            TriggerEvent("nh-context:createMenu", menu)
        elseif Config.QBMenu then
            TriggerEvent("qb-menu:client:openMenu", menu)
        elseif Config.OXLib then
            lib.registerContext({
                id = 'taximenu_ox',
                options = menu,
                title = Config.Lang['taxi_menu_header_1']..info.name..Config.Lang['taxi_menu_header_2']..info.estimatedFare,
                position = 'top-right',
            }, function(selected, scrollIndex, args)
            end)
            lib.showContext('taximenu_ox')
        end 
    end)

    RegisterNetEvent('angelicxs-CivilianJobs:taxiJob:JobAccepted', function(data)
        if not data then
            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['taxi_fare_declined'], Config.LangType['error'])
        elseif data.name then
            onRoute = true
            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['taxi_fare_accepted']..data.name, Config.LangType['info'])
            TaxiRouteManager(data)
        end
    end)

    function TaxiRouteManager(data)
        TriggerEvent('angelicxs-CivilianJobs:MAIN:RouteMarker', false, data.safeStart, 'Pick Up Location', 'TaxiRouteManager()')
        taxiPedSpawn = false
        while true do
            local sleep = 1100
            local coord = GetEntityCoords(PlayerPedId())
            local dist = #(coord-data.safeStart)
            if dist <= 75 and UsingMissionVehicle() then
                sleep = 550
                if not taxiPedSpawn then
                    SpawntaxiPed(data.start)
                end
                if dist <= 25 then
                    sleep = 0
                    if dist <= 15 then
                        if IsVehicleStopped(MissionVehicle) then
                            FreezeEntityPosition(MissionVehicle, true)
                            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['taxi_get_on'], Config.LangType['info'])
                            GetOnTaxi(data.safeStart)
                            while not IsPedInVehicle(taxiPed, MissionVehicle, true) do
                                Wait(500)
                            end
                            FreezeEntityPosition(MissionVehicle, false)
                            break
                        end
                    end
                end
            end
            Wait(sleep)            
        end
        while not IsPedInAnyVehicle(taxiPed, true) do Wait(500) end
        TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['taxi_bring_client'], Config.LangType['info'])
        TriggerEvent('angelicxs-CivilianJobs:MAIN:RouteMarker', false, data.safeFinish, 'Drop Off Location', 'TaxiRouteManager()')
        while true do
            local sleep = 1100
            local coord = GetEntityCoords(PlayerPedId())
            local dist = #(coord-data.safeFinish)
            if dist <= 75 and UsingMissionVehicle() then
                sleep = 550
                if dist <= 25 then
                    sleep = 0
                    if dist <= 15 then
                        if Taxi_Options.Routes.DropMakerAllow then
                            DrawMarker(Taxi_Options.Routes.DropMarker, data.safeFinish.x, data.safeFinish.y, (data.safeFinish.z+2), 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 100, 200, 50, 255, true, true, 2, 0.0, false, false, false)
                        end
                        if IsVehicleStopped(MissionVehicle) then
                            FreezeEntityPosition(MissionVehicle, true)
                            onRoute = false
                            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['taxi_get_off'], Config.LangType['info'])
                            GetOffTaxi(data.safeStart, data.safeFinish)
                            while IsPedInVehicle(taxiPed, MissionVehicle, true) do
                                Wait(500)
                            end
                            FreezeEntityPosition(MissionVehicle, false)
                            break
                        end
                    end
                end
            end
            Wait(sleep)  
        end
        TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['taxi_route_complete'], Config.LangType['success'])
    end

    function SpawntaxiPed(coords)
        taxiPedSpawn = true
        local model = Randomizer(taxiPedOptions, 'SpawntaxiPed()')
        local hash = HashGrabber(model)
        taxiPed = CreatePed(3, hash, coords.x, coords.y, (coords.z-1), coords.w, false, false)
        FreezeEntityPosition(taxiPed, true)
        SetEntityInvincible(taxiPed, true)
        SetBlockingOfNonTemporaryEvents(taxiPed, true)
        TaskStartScenarioInPlace(taxiPed,'WORLD_HUMAN_STAND_MOBILE', 0, false)
        SetModelAsNoLongerNeeded(model)
    end

    function GetOnTaxi(coords)
        if #(coords-GetEntityCoords(PlayerPedId())) > 15 then
            print(Config.ErrorCodes['dev'], Config.ErrorCodes['007'], 'GetOnTaxi()')
            return
        end
        for i = GetVehicleMaxNumberOfPassengers(MissionVehicle), 0, -1 do
            if IsVehicleSeatFree(MissionVehicle, i) then
                FreezeEntityPosition(taxiPed, false)
                ClearPedTasksImmediately(taxiPed)
                TaskEnterVehicle(taxiPed, MissionVehicle, -1, i, 1.0, 1, 0)
                return
            end
        end
        print(Config.ErrorCodes['dev'], Config.ErrorCodes['002'], 'GetOnTaxi()')
    end

    function GetOffTaxi(inital, final)
        TaskLeaveVehicle(taxiPed, MissionVehicle, 0)
        if Taxi_Options.Payment.flatRate then
            PaymentFlat(Taxi_Options.Payment.flatRateAmount, 'Taxi Job - GetOffTaxi()')
        else
            DistancePayment(inital, final, 'Taxi Job - GetOffTaxi()', Taxi_Options.Payment.DistanceMultiplier)
        end
        if Taxi_Options.Payment.materialGain then
            for i = 1, #Taxi_Options.Payment.materialList do
                PaymentItemMaterial(Taxi_Options.Payment.materialList[i], 'Taxi Job - GetOffTaxi()')
            end
        end
        TaskGoStraightToCoord(taxiPed, inital.x, inital.y, inital.z, 1.0, -1.0, 0.0, 0.0)
        Wait(2000)
        TaskGoStraightToCoord(taxiPed, final.x, final.y, final.z, 1.0, -1.0, 0.0, 0.0)
        SetEntityAsNoLongerNeeded(taxiPed)
        taxiPed = nil
        taxiPedSpawn = false
    end

    AddEventHandler('angelicxs-CivilianJobs:Main:ResetJobs', function()
        if DoesEntityExist(taxiPed) then
            DeleteEntity(taxiPed)
        end
        startWorking = false
        taxiPed = nil
        taxiPedSpawn = false
        onRoute = false
    end)
end
