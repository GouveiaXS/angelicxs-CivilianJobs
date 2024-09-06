----------------------------------------------------------------------
--				JetSki Configuration Options			    		--
--			 The following options can be changed to make your      --
--			  jetski job unique and suit your server        		--
----------------------------------------------------------------------

local Jetski_Options = {
    Boss = {
        Location = vector4(-1533.22, -1281.41, 1.5, 102.75),
        Model = 's_m_y_baywatch_01',
    },
    Sprite = {
        icon = 153,
        colour = 12,
        name = 'Angelic Lifeguard Co',
    },
    Boat = {
        Spawn = vector4(-1543.41, -1282.93, 0.66, 116.65),
        Type = {
            'seashark',
        }
    },
    Payment = {
        flatRate = false,
        flatRateAmount = 100,
        DistanceMultiplier = 1, -- Only applies if flatRate = false, pays driver based on multiplying distance from pick up to drop off.
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
}

local personOptions = {
    AllowMarker = true,
    LocationMarker = 0,
    Location = {
        vector3(-1593.09, -1571.25, -0.52),
        vector3(-1445.22, -1669.8, -0.4),
        vector3(-1910.59, -1366.43, -0.39),
        vector3(-1954.73, -1128.37, 0.14),
        vector3(-2237.36, -798.34, 0.63)
    },
    ReturnAllowMarker = false,
    ReturnLocationMarker = 0,
}

local swimPedOptions = {
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
--						 JetSki Script       					    --
--		It is NOT recommended to change any of the following        --
----------------------------------------------------------------------

local PedSpawned = false
local swimPed = nil

if Config.JetSkiJobOn then
    CreateThread(function()
        JobBlip(Jetski_Options.Boss.Location, Jetski_Options.Sprite.icon, Jetski_Options.Sprite.colour, Jetski_Options.Sprite.name)
        Job3DText(Jetski_Options.Boss.Location, 'angelicxs-CivilianJobs:JetskiJob:AskForWork', 'angelicxs-CivilianJobs:JetskiJob:HowTo')
        while true do
            local Pos = GetEntityCoords(PlayerPedId())
            local JetBoss = vector3(Jetski_Options.Boss.Location.x, Jetski_Options.Boss.Location.y, Jetski_Options.Boss.Location.z)
            local Dist = #(Pos - JetBoss)
            if Dist <= 50 and not PedSpawned then
                TriggerEvent('angelicxs-CivilianJobs:MAIN:SpawnBossNPC', Jetski_Options.Boss.Model, Jetski_Options.Boss.Location, 'angelicxs-CivilianJobs:JetskiJob:AskForWork', 'angelicxs-CivilianJobs:JetskiJob:HowTo', ' JetskiJob.lua')
                PedSpawned = true
            elseif PedSpawned and Dist > 50 then
                PedSpawned = false
            end
            Wait(2000)
        end
    end)

    RegisterNetEvent('angelicxs-CivilianJobs:JetskiJob:HowTo', function()
        TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['gen_how_to'], Config.LangType['info'])
        print(Config.Lang['jetski_how_to'])
    end)

    RegisterNetEvent('angelicxs-CivilianJobs:JetskiJob:AskForWork', function()
        if FreeWork or PlayerJob == Config.JetSkiJobName then
            if gettingMissionVehicle then TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['getting_vehicle'], Config.LangType['error']) return end
            if not MissionVehicle then
                local ChosenJet = Randomizer(Jetski_Options.Boat.Type, 'angelicxs-CivilianJobs:JetskiJob:AskForWork')
                TriggerEvent('angelicxs-CivilianJobs:MAIN:CreateVehicle', ChosenJet, Jetski_Options.Boat.Spawn, 'angelicxs-CivilianJobs:JetskiJob:AskForWork')
                while not DoesEntityExist(MissionVehicle) do
                    Wait(25)
                end
                TriggerEvent('angelicxs-CivilianJobs:JetskiJob:BeginWork')
            else
                TriggerEvent('angelicxs-CivilianJobs:JetskiJob:BeginWork')
            end
        else
            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['wrong_job'], Config.LangType['error'])
        end
    end)

    RegisterNetEvent('angelicxs-CivilianJobs:JetskiJob:BeginWork', function()
        if not DoesEntityExist(swimPed) then
            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['jetski_start'], Config.LangType['info'])
            swimPedCreator()
        else
            TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['jetski_on_job'], Config.LangType['error'])
        end
    end)

    function swimPedCreator()
        local coords = Randomizer(personOptions.Location, 'swimPedCreator()')
        local model = Randomizer(swimPedOptions, 'swimPedCreator()')
        local heading = (math.random(0,360)+0.01)
        while not coords and not model do Wait(10) end
        local hash = HashGrabber(model)
        while not hash do Wait(10) end
        swimPed = CreatePed(3, hash, coords.x, coords.y, (coords.z-1), heading, false, false)
        FreezeEntityPosition(swimPed, true)
        SetEntityInvincible(swimPed, true)
        SetModelAsNoLongerNeeded(model)
        TriggerEvent('angelicxs-CivilianJobs:MAIN:RouteMarker', false, coords, 'Help Requried Report', 'swimPedCreator()')
        local alert = false
        local liveswim = false
        while true do 
            local sleep = 1000
            local coord = GetEntityCoords(PlayerPedId())
            if #(coord-coords) <40 then
                sleep = 0
                if not alert then
                    alert = true
                    TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['jetski_help_civ'], Config.LangType['info'])
                end
                if personOptions.AllowMarker then
                    DrawMarker(personOptions.LocationMarker, coords.x, coords.y, (coords.z+2), 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 100, 200, 50, 255, true, true, 2, 0.0, false, false, false)
                end
                if #(coord-coords) <= 10 then
                    if not liveswim then
                        liveswim = true
                        FreezeEntityPosition(swimPed, false)
                        Wait(500)
                        FreezeEntityPosition(swimPed, true)
                    end
                    if #(coord-coords) <= 5 then
                        SetVehicleEngineOn(MissionVehicle, false, true, true)
                        Wait(500)
                        FreezeEntityPosition(MissionVehicle, true)
                        grabSwimPed(coord)
                        break
                    end
                end
            end
            Wait(sleep)
        end
        SwimDropLocation(coords)
    end

    function grabSwimPed(coord)
        local ped = PlayerPedId()
        LoadAnim('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
        TaskPlayAnim(ped,"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer",1.0, -1.0, -1, 49, 0, 0, 0, 0)
        Wait(3000)
        ClearPedTasks(ped)
        RequestAnimDict("nm")
        while not HasAnimDictLoaded("nm") do
            Wait(0)
        end
        ClearPedTasks(swimPed)
        ClearPedSecondaryTask(swimPed)
        ClearPedTasksImmediately(swimPed)
        SetEntityCoords(swimPed, coord.x, coord.y, coord.z+1)
        TaskPlayAnim(swimPed, 'nm', 'firemans_carry', 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
        AttachEntityToEntity(swimPed,ped, 0, 0.27, 0.15, 0.63, 0.5, 0.5, 0.0, false, false, false, false, 2, false)
        TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['jetski_return_civ'], Config.LangType['info'])
        FreezeEntityPosition(MissionVehicle, false)
        SetVehicleEngineOn(MissionVehicle, true, false, false)
        RemoveAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
        RemoveAnimDict("nm")
    end

    function SwimDropLocation(inital)
        local location = vector3(Jetski_Options.Boss.Location.x, Jetski_Options.Boss.Location.y, Jetski_Options.Boss.Location.z)
        TriggerEvent('angelicxs-CivilianJobs:MAIN:RouteMarker', false, location, 'Return Location', 'SwimDropLocation()')
        while true do 
            local sleep = 1000
            local ped = PlayerPedId()
            local coord = GetEntityCoords(ped)
            if #(coord-location) <40 then
                sleep = 0
                if personOptions.ReturnAllowMarker then
                    DrawMarker(personOptions.ReturnLocationMarker, location.x, location.y, (location.z+2), 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 100, 200, 50, 255, true, true, 2, 0.0, false, false, false)
                end
                if #(coord-location) <= 10 then
                    Wait(1000)
                    if math.random(0,2) == 2 then
                        saveSwimNPC(true, location)
                    else
                        saveSwimNPC(false, location)
                    end
                    break
                end
            end
            Wait(sleep)
        end
        if Jetski_Options.Payment.flatRate then
            PaymentFlat(Jetski_Options.Payment.flatRateAmount, 'JetSki Job - SwimDropLocation()')
        else
            DistancePayment(inital, location, 'JetSki Job - SwimDropLocation()', Jetski_Options.Payment.DistanceMultiplier)
        end
        if Jetski_Options.Payment.materialGain then
            for i = 1, #Jetski_Options.Payment.materialList do
                PaymentItemMaterial(Jetski_Options.Payment.materialList[i], 'JetSki Job - SwimDropLocation()')
            end
        end
        TriggerEvent('angelicxs-CivilianJobs:Notify', Config.Lang['jetski_job_complete'], Config.LangType['success'])
        if Config.ContinousMode then
            local headerName = Config.Lang['continous_mode_header']
            local options = {
                {
                    header = Config.Lang['continous_mode_yes'], -- nh / qbmenu
                    event = 'angelicxs-CivilianJobs:JetskiJob:BeginWork', -- nh
                    params = { -- qb menu
                        event = 'angelicxs-CivilianJobs:JetskiJob:BeginWork',
                    },
                    title = Config.Lang['continous_mode_yes'], -- oxlibs
                    onSelect = function() -- oxlibs
                        TriggerEvent("angelicxs-CivilianJobs:JetskiJob:BeginWork")
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
        end
    end

    function saveSwimNPC(style, location)
        local ped = PlayerPedId()
        if style then
            ClearPedTasks(ped)
            DetachEntity(swimPed, false, false)
            ClearPedTasks(swimPed)
            PlaceObjectOnGroundProperly(swimPed)
            SetEntityHeading(ped, GetEntityHeading(swimPed))
            TaskTurnPedToFaceEntity(ped, swimPed, 100) 
            RequestAnimDict("mini@cpr@char_a@cpr_str")
            while not HasAnimDictLoaded("mini@cpr@char_a@cpr_str") do
                Wait(0)
            end
            TaskPlayAnim(ped,"mini@cpr@char_a@cpr_str","cpr_pumpchest",1.0, -1.0, -1, 49, 0, 0, 0, 0)
            Wait(3000)
            ClearPedTasks(ped)
        else
            FreezeEntityPosition(ped, true)
            ClearPedTasks(ped)
            FreezeEntityPosition(swimPed, false)
            DetachEntity(swimPed, false, false)
            PlaceObjectOnGroundProperly(swimPed)
            ClearPedTasks(swimPed)
            TaskGoToCoordAnyMeans(swimPed, location.x, location.y, location.z, 1, 0, 0, 786603, 0)
            Wait(2000)
            SetEntityAsNoLongerNeeded(swimPed)
            swimPed = nil
            FreezeEntityPosition(ped, false)
        end
        ClearPedTasks(swimPed)
        TaskGoToCoordAnyMeans(swimPed, location.x, location.y, location.z, 1, 0, 0, 786603, 0)
        Wait(2000)
        SetEntityAsNoLongerNeeded(swimPed)
        swimPed = nil
        FreezeEntityPosition(ped, false)
        RemoveAnimDict("mini@cpr@char_a@cpr_str")
    end

    AddEventHandler('angelicxs-CivilianJobs:Main:ResetJobs', function()
        if DoesEntityExist(swimPed) then
            DeleteEntity(swimPed)
        end
        swimPed = nil
    end)
end
