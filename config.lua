----------------------------------------------------------------------
-- Thanks for supporting AngelicXS Scripts!							--
-- Support can be found at: https://discord.gg/tQYmqm4xNb			--
-- More paid scripts at: https://angelicxs.tebex.io/ 				--
-- More FREE scripts at: https://github.com/GouveiaXS/ 				--
-- Images are provided for new items if you choose to add them 		--
----------------------------------------------------------------------

----------------------------------------------------------------------
--						Main Configuration 							--
--			To configure jobs uniquely see each client file			--
--			for additional config options specific to the job		--
----------------------------------------------------------------------

-- Model info: https://docs.fivem.net/docs/game-references/ped-models/
-- Blip info: https://docs.fivem.net/docs/game-references/blips/

Config = {}

Config.UseESX = false						-- Use ESX Framework
Config.UseQBCore = true						-- Use QBCore Framework (Ignored if Config.UseESX = true)

Config.NHInput = false						-- Use NH-Input [https://github.com/nerohiro/nh-keyboard]
Config.NHMenu = false						-- Use NH-Menu [https://github.com/nerohiro/nh-context]
Config.QBInput = true						-- Use QB-Input (Ignored if Config.NHInput = true) [https://github.com/qbcore-framework/qb-input]
Config.QBMenu = true						-- Use QB-Menu (Ignored if Config.NHMenu = true) [https://github.com/qbcore-framework/qb-menu]
Config.OXLib = false						-- Use the OX_lib (Ignored if Config.NHInput or Config.QBInput = true) [https://github.com/overextended/ox_lib]  !! must add shared_script '@ox_lib/init.lua' and lua54 'yes' to fxmanifest!!

Config.UseCustomNotify = false				-- Use a custom notification script, must complete event below.
-- Only complete this event if Config.UseCustomNotify is true; mythic_notification provided as an example
RegisterNetEvent('angelicxs-CivilianJobs:CustomNotify')
AddEventHandler('angelicxs-CivilianJobs:CustomNotify', function(message, type)
    --exports.mythic_notify:SendAlert(type, message, 4000)
end)

-- Visual Preference
Config.Use3DText = false 					-- Use 3D text for NPC/Job interactions; only turn to false if Config.UseThirdEye is turned on and IS working.
Config.UseThirdEye = true 					-- Enables using a third eye (third eye requires the following arguments debugPoly, useZ, options {event, icon, label}, distance)
Config.ThirdEyeName = 'qb-target' 			-- Name of third eye aplication
Config.UsePedAsJobBoss = true				-- Creates a ped at the interaction location to initiate each job (required if Config.UseThirdEye = true)

-- General Blip Preference
Config.JobBlipSize = 0.7
Config.BlipMarkerColour = 24
Config.BlipRouteColour = 15


-- Rewards Configuration
Config.AccountMoney = 'cash' 				-- How you want the job completion to be paid.

-- Usable Item Config
Config.ScubaItemName = 'diving_gear'		-- Name of scuba gear item to put on/take off scuba gear

-- General Configuration
Config.UsePlayerJob = false					-- If true requires the player to have the appropriate job; job uses and names identified next
Config.VehicleSteward = true				-- If true, will not let the player do any more jobs if they have returned a destroyed vehicle (they will need to relog to reset this)
Config.BusJobOn = true						-- If true allows the bus job
Config.BusJobName = 'bus-driver'			-- Name of the bus job, used if Config.UsePlayerJob = true
Config.ForkliftJobOn = true					-- If true allows the forklift job
Config.ForkliftJobName = 'forklift-driver'	-- Name of the forklift job, used if Config.UsePlayerJob = true
Config.TaxiJobOn = true						-- If true allows the taxi job
Config.TaxiJobName = 'taxi-driver'			-- Name of the taxi job, used if Config.UsePlayerJob = true
Config.ScubaJobOn = true					-- If true allows the scuba job
Config.ScubaJobName = 'scuba-diver'			-- Name of the scuba job, used if Config.UsePlayerJob = true
Config.JetSkiJobOn = true					-- If true allows the JetSKi job
Config.JetSkiJobName = 'lifeguard'			-- Name of the JetSKi job, used if Config.UsePlayerJob = true
Config.HeliJobOn = true						-- If true allows the Heli job
Config.HeliJobName = 'heli-driver'			-- Name of the Heli job, used if Config.UsePlayerJob = true
Config.GarbageJobOn = true					-- If true allows the Garbage job
Config.GarbageJobName = 'garbage-driver'	-- Name of the Garbage job, used if Config.UsePlayerJob = true


-- Vehicle Keys and Fuel; set the below event to give the player keys and fuel for the vehicle (if applicable)
RegisterNetEvent('angelicxs-CivilianJobs:VehicleInitation')
AddEventHandler('angelicxs-CivilianJobs:VehicleInitation', function(vehicle)
	-- Example provided:
	TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
    exports["ps-fuel"]:SetFuel(vehicle, 99)
end)

-- Language Configuration
Config.LangType = {
	['error'] = 'error',
	['success'] = 'success',
	['info'] = 'primary'
}

Config.Lang = {
	['request_job_3d'] = 'Press ~r~[E]~w~ to change job.',
	['request_job'] = 'Change Job',
	['request_work_3d'] = 'Press ~r~[E]~w~ to request work. \n Press ~r~[G]~w~ to return work vehicle. \n Press ~r~[F]~w~ to find out how job works.',
	['request_work'] = 'Request Work',
	['ask_how_to'] = 'Ask How Job Works',
	['wrong_job'] = 'You do not have the correct job to do this work!',
	['at_route_marker'] = 'You have reached the indicated destination!',
	['vehicle_out'] = 'You have already been provided a vehicle!',
	['gen_how_to'] = 'Press F8 to view your console and read how the job works!',
	['vehicle_return_request'] = 'Return Vehicle',
	['vehicle_return'] = 'You have returned your work vehicle!',
	['vehicle_far'] = 'Bring your vehicle closer to return it!',
	['vehicle_not_out'] = 'You do not have a vehicle currently out!',
	['vehicle_destroyed'] = 'You destroyed our vehicle, I am telling everyone in town and you are not getting another one today!',
	['vehicle_destroyed_notice'] = 'You destroyed a work vehicle, come back tomorrow for another chance!',
	['payment_notice_money'] = 'You have recevied the following amount for your work: $',
	['payment_notice_item'] = 'You have recevied the following item for your work:',
	['gen_anchor_boat'] = 'You must be in a boat to use this command.',
	['gen_anchor_boat_activate'] = 'You must be in the driver seat to anchor or unachor a boat.',
	['gen_anchor_boat_off'] = 'You have unanchored the boat.',
	['gen_anchor_boat_on'] = 'You have anchored the boat.',

-- Bus Language
	['bus_how_to'] = 'Drive to each spot marked on your route and wait for either a passenger to get on or for the passsenger to get off. Payment is made when the passenger gets off the bus. If you skip a stop you must return their to pick up/drop off the passenger.',
	['bus_route_complete'] = 'You have completed the route, return to the bus terminal to return your vehicle or ask for a new route!',
	['bus_on_route'] = 'You have already been assigned a route, please finish it before requesting a new one!',
	['bus_start'] = 'Go ahead and complete the route I sent you!',
	['bus_get_on'] = 'A passenger is getting on.',
	['bus_get_off'] = 'A passenger is getting off.',

-- Forklift Language
	['forklift_how_to'] = 'Take the forklift ot the indcated spot to pick up the pallet, use numpad 5 and numpad 8 to lower/raise the forks. Drop off the pallet at the indicated truck for payment.',
	['forklift_start'] = 'Go grab the ordered pallet and put it in the marked truck!',
	['forklift_on_job'] = 'You have not finished the current order!',
	['forklift_job_complete'] = 'You have completed the order, return the forklift or ask for a new order!',

-- Taxi Language
	['taxi_how_to'] = 'After a period of time you will be provided a fare you can choose to accept or decline, if you decline you will need to wait for another fare to appear. Upon acceptance pick up the indiviudal and drop them off for payment.',
	['taxi_start'] = 'Get out there and drive around, I will send you your first fare soon!',
	['taxi_working'] = 'Get out there and finish some fares!',
	['taxi_menu_header_1'] = 'Incoming Taxi Request:\nName: ',
	['taxi_menu_header_2'] = '\nEstimated Fare: $',
	['taxi_menu_yes'] = 'Accept Fare',
	['taxi_menu_no'] = 'Decline Fare',
	['taxi_get_on'] = 'A passenger is getting on.',
	['taxi_get_off'] = 'A passenger is getting off.',
	['taxi_bring_client'] = 'Bring the customer to their destination!',
	['taxi_fare_accepted'] = 'You accepted the fare, go pick up ',
	['taxi_fare_declined'] = 'You declined the fare, wait for another request!',
	['taxi_route_complete'] = 'You have completed the fare, you will receive another fare when it is available!',

-- Scuba Language
	['scuba_how_to'] = 'Long explanation here',
	['scuba_start'] = 'Go to the indicated area and search for the crates, make sure you have your gear before you go! The following amount of crates were detected in the area:',
	['scuba_on_job'] = 'You already have an indicated scuba dive location!',
	['scuba_salvage'] = 'Salvage Crate',
	['scuba_salvage_3d'] = 'Press ~r~[E]~w~ to salvage crate.',
	['scuba_salvage_complete'] = 'You successfully salvaged the crate!',
	['scuba_75'] = 'Tank Oxygen is at 75%!',
	['scuba_50'] = 'Tank Oxygen is at 50%!',
	['scuba_25'] = 'Tank Oxygen is at 25%!',
	['scuba_in_water'] = 'You can not do this while in water!',
	
-- Heli Language
	['heli_how_to'] = 'Long explanation here',
	['heli_start'] = 'Go pick up priority crate delivery and deliver it to the customer!',
	['heli_on_job'] = 'You have not finished the current order!',
	['heli_job_complete'] = 'You have completed the order, return back to the heli pad and either return the helicopter or ask for a new order!',

-- Lifeguard Language
	['jetski_how_to'] = 'Get to the inidcated spot to pick up the civilian drowning, then bring them back to the lifeguard to save them and get payment.',
	['jetski_start'] = 'Go check out this area, we got a call saying someone needs help!',
	['jetski_on_job'] = 'You have not checked out that last report!',
	['jetski_job_complete'] = 'You saved them! Return your vehicle or check for more reports by talking to the lifeguard.',
	['jetski_help_civ'] = 'You found the report! Stop near the civilian to help them!',
	['jetski_return_civ'] = 'Return the civilian to the lifeguard to make sure they are okay!',
	
-- Garbage Language
	['garbage_how_to'] = 'Drive to each marked location to pick up the garbage and then throw the garbage bag in the truck. Once all stops are completed payment will be made.',
	['garbage_start'] = 'Follow the mark route to grab the garbage and throw it in the truck',
	['garbage_on_job'] = 'You have not finished the current route assigned to you!',
	['garbage_search_bin_3D'] = 'Press ~r~[E]~w~ to search garbage.',
	['garbage_search_bin'] = 'Search Garbage',
	['garbage_route_complete'] = 'Route complete! See the Trash Master to return the truck or get a new route!',
	['garbage_get_garbage'] = 'Press ~r~[G]~w~ to grab garbage.',
	['garbage_put_garbage'] = 'Press ~r~[G]~w~ to put garbage in truck.',
	['garbage_item_find'] = 'You found an item in the garbage!',
	['garbage_item_nofind'] = 'There is nothing in the garbage.',
	['garbage_in_truck'] = 'The garbage has been loaded, head to the next spot!',
}

Config.ErrorCodes = {
	['dev'] = 'Please provide the following information to your development team:',
	['001'] = 'The Randomizer function found in the main config failed. List was found to be nil and was called from the following event:',
	['002'] = 'A return/break loop has finished unintentionally. Loop was called from the following event:',
	['003'] = 'Warning, the following model took over one (1) second to load (reference from HashGrabber - main.lua):',
	['004'] = 'An undefined route was asked to be created from the following event:',
	['005'] = 'A second ped spawn has automatically been aborted, requesting eventor:',
	['006'] = 'A second vehicle spawn has automatically been aborted, requesting eventor:',
	['007'] = 'Warning, error dectected see comment for further details, requesting eventor:', -- !!!! If you see this error it was most likely triggered by an injector !!!!
	['008'] = 'A vehicle despawn was attempted without a job NPC spawned',
	['009'] = 'A payment failed to occur! (reference from DistancePayment - main.lua)',  -- !!!! If you see this error it was most likely triggered by an injector !!!!
	['010'] = 'A payment failed to occur! (reference from PaymentFlat - main.lua)',  -- !!!! If you see this error it was most likely triggered by an injector !!!!
	['011'] = 'A payment failed to occur! (reference from PaymentItem - main.lua)',  -- !!!! If you see this error it was most likely triggered by an injector !!!!
	['012'] = 'Exploit detected.',
	['013'] = 'The player with the following server ID and license has been dropped for suspected exploit (triggered multiple payment/gain item events within 1 second): ',




}
