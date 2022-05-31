local QBCore = exports['qb-core']:GetCoreObject()
local pedloaded = false

RegisterNetEvent('qb-methdelivery:client:StartJob', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"idle"})
    QBCore.Functions.Progressbar('pickup_sla', 'Getting Job...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    QBCore.Functions.Notify('Go Grab me some Meth man!', 'primary', 7500)
    
    Wait(Config.DeliveryWait)

    QBCore.Functions.Notify('Location has been addedto GPS!', 'primary', 7500)
    TriggerServerEvent('qb-methdelivery:server:StartJob')
    ChooseDropOff()
    end)
end)

RegisterNetEvent('qb-methdelivery:client:knockdoor', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"knock"})
    QBCore.Functions.Progressbar('pickup_sla', 'Buying the meth...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
    QBCore.Functions.Notify('take it back to the meth-head', 'primary', 7500)

    TriggerServerEvent('qb-methdelivery:server:KnockDoor')
    end)
end)

RegisterNetEvent('qb-methdelivery:client:ReceivePayment', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"idle"})
    QBCore.Functions.Progressbar('pickup_sla', 'Handing Drugs...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()

        TriggerServerEvent('qb-methdelivery:server:ReceivePayment')
    end)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k, v in pairs(Config.JobPed) do
			local pos = GetEntityCoords(PlayerPedId())	
			local dist = #(pos - vector3(v.coords.x, v.coords.y, v.coords.z))
			
			if dist < 40 and not pedspawned then
				TriggerEvent('qb-methdelivery:spawn:ped', v.coords)
				pedspawned = true
			end
			if dist >= 35 then
				pedspawned = false
				DeletePed(npc)
			end
		end
	end
end)

RegisterNetEvent('qb-methdelivery:spawn:ped')
AddEventHandler('qb-methdelivery:spawn:ped',function(coords)
	local hash = `s_m_y_ammucity_01`

	RequestModel(hash)
	while not HasModelLoaded(hash) do 
		Wait(10)
	end

    	pedloaded = true
        npc = CreatePed(5, hash, coords.x, coords.y, coords.z - 1.0, coords.w, false, false)
        FreezeEntityPosition(npc, true)
        SetBlockingOfNonTemporaryEvents(npc, true)
        loadAnimDict("amb@world_human_cop_idles@male@idle_b") 
        TaskPlayAnim(npc, "amb@world_human_cop_idles@male@idle_b", "idle_e", 8.0, 1.0, -1, 17, 0, 0, 0, 0)
end)

function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(5)
    end
end

RegisterNetEvent('qb-methdelivery:client:DeliveryJob', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Meth-Head |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Start Pickup",
            txt = "Go get some meth!",
            params = {
                event = "qb-methdelivery:client:StartJob"
            }
        },
        {
           
            header = "• Give Meth",
            txt = "Give large bag of meth",
            params = {
                event = "qb-methdelivery:client:ReceivePayment"
            }
        },
        {
            
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)

function ChooseDropOff()
    local prob = math.random(1, 10)

    if prob == 1 then
        SetNewWaypoint(Config.PickUpPoint1)
        ChooseDropOff1()
    elseif prob == 2 then
        SetNewWaypoint(Config.PickUpPoint2)
        ChooseDropOff2()
    elseif prob == 3 then
        SetNewWaypoint(Config.PickUpPoint3)
        ChooseDropOff3()
    elseif prob == 4 then
        SetNewWaypoint(Config.PickUpPoint4)
        ChooseDropOff4()
    elseif prob == 5 then
        SetNewWaypoint(Config.PickUpPoint5)
        ChooseDropOff5()
    elseif prob == 6 then
        SetNewWaypoint(Config.PickUpPoint6)
        ChooseDropOff6()
    elseif prob == 7 then
        SetNewWaypoint(Config.PickUpPoint7)
        ChooseDropOff7()
    elseif prob == 8 then
        SetNewWaypoint(Config.PickUpPoint8)
        ChooseDropOff8()
    elseif prob == 9 then
        SetNewWaypoint(Config.PickUpPoint9)
        ChooseDropOff9()
    elseif prob == 10 then
        SetNewWaypoint(Config.PickUpPoint10)
        ChooseDropOff10()
    end
end

function ChooseDropOff1()
    exports['qb-target']:AddBoxZone("cash-roll", Config.PickUpPoint1, 1, 1, {
        name="cash-roll",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "qb-methdelivery:client:knockdoor",
            icon = "far fa-box",
            label = "Knock Door",
            item = "cash-roll",
            },
        },
        distance = 2.5
    })
end

function ChooseDropOff2()
    exports['qb-target']:AddBoxZone("cash-roll", Config.PickUpPoint2, 1, 1, {
        name="cash-roll",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "qb-methdelivery:client:knockdoor",
            icon = "far fa-box",
            label = "Knock Door",
            item = "cash-roll",
            },
        },
        distance = 2.5
    })
end

function ChooseDropOff3()
    exports['qb-target']:AddBoxZone("cash-roll", Config.PickUpPoint3, 1, 1, {
        name="cash-roll",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "qb-methdelivery:client:knockdoor",
            icon = "far fa-box",
            label = "Knock Door",
            item = "cash-roll",
            },
        },
        distance = 2.5
    })
end

function ChooseDropOff4()
    exports['qb-target']:AddBoxZone("cash-roll", Config.PickUpPoint4, 1, 1, {
        name="cash-roll",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "qb-methdelivery:client:knockdoor",
            icon = "far fa-box",
            label = "Knock Door",
            item = "cash-roll",
            },
        },
        distance = 2.5
    })
end

function ChooseDropOff5()
    exports['qb-target']:AddBoxZone("cash-roll", Config.PickUpPoint5, 1, 1, {
        name="cash-roll",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "qb-methdelivery:client:knockdoor",
            icon = "far fa-box",
            label = "Knock Door",
            item = "cash-roll",
            },
        },
        distance = 2.5
    })
end

function ChooseDropOff6()
    exports['qb-target']:AddBoxZone("cash-roll", Config.PickUpPoint6, 1, 1, {
        name="cash-roll",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "qb-methdelivery:client:knockdoor",
            icon = "far fa-box",
            label = "Knock Door",
            item = "cash-roll",
            },
        },
        distance = 2.5
    })
end

function ChooseDropOff7()
    exports['qb-target']:AddBoxZone("cash-roll", Config.PickUpPoint7, 1, 1, {
        name="cash-roll",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "qb-methdelivery:client:knockdoor",
            icon = "far fa-box",
            label = "Knock Door",
            item = "cash-roll",
            },
        },
        distance = 2.5
    })
end

function ChooseDropOff8()
    exports['qb-target']:AddBoxZone("cash-roll", Config.PickUpPoint8, 1, 1, {
        name="cash-roll",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "qb-methdelivery:client:knockdoor",
            icon = "far fa-box",
            label = "Knock Door",
            item = "cash-roll",
            },
        },
        distance = 2.5
    })
end

function ChooseDropOff9()
    exports['qb-target']:AddBoxZone("cash-roll", Config.PickUpPoint9, 1, 1, {
        name="cash-roll",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "qb-methdelivery:client:knockdoor",
            icon = "far fa-box",
            label = "Knock Door",
            item = "cash-roll",
            },
        },
        distance = 2.5
    })
end

function ChooseDropOff10()
    exports['qb-target']:AddBoxZone("cash-roll", Config.PickUpPoint10, 1, 1, {
        name="cash-roll",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "qb-methdelivery:client:knockdoor",
            icon = "far fa-box",
            label = "Knock Door",
            item = "cash-roll",
            },
        },
        distance = 2.5
    })
end
