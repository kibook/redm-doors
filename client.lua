local Doors = {
	2642457609, -- Valentine bank, front entrance, left door
	3886827663, -- Valentine bank, front entrance, right door
	1340831050, -- Valentine bank, gate to tellers
	576950805,  -- Valentine bank, vault door
	3718620420, -- Valentine bank, door behind tellers
	2343746133, -- Valentine bank, door to backrooms
	2307914732, -- Valentine bank, back door

	1733501235, -- Saint Denis bank, west entrance, right door
	2158285782, -- Saint Denis bank, west entrance, left door
	1634115439, -- Saint Denis bank, manager's office, right door
	965922748,  -- Saint Denis bank, manager's office, left door
	2817024187, -- Saint Denis bank, north entrance, left door
	2089945615, -- Saint Denis bank, north entrance, right door
	1751238140, -- Saint Denis bank, vault

	531022111,  -- Blackwater bank, entrance
	2817192481, -- Blackwater bank, office
	2117902999, -- Blackwater bank, teller gate
	1462330364, -- Blackwater bank, vault

	3317756151, -- Rhodes bank, front entrance, left door
	3088209306, -- Rhodes bank, front entrance, right door
	2058564250, -- Rhodes bank, door to backrooms
	1634148892, -- Rhodes bank, teller gate
	3483244267, -- Rhodes bank, vault
	--3142122679, -- Rhodes bank, back entrance
	
	340151973,  -- Saint Denis theatre, right door
	544106233,  -- Saint Denis theatre, left door
	1457151494, -- Saint Denis theatre, behind counter, right door
	1688533403, -- Saint Denis theatre, behind counter, left door

	1239033969, -- Farm house outside emerald ranch, bedroom door

	3074790964, -- Geddes ranch house

	3101287960, -- Armadillo bank, front door
	3550475905, -- Armadillo bank, teller gate
	1366165179, -- Armadillo bank, back door

	772977516,  -- Slaver catcher house, north door
	527767089,  -- Slaver catcher house, south door

	3804893186, -- Saint Denis tailor, dressing room
	2432590327, -- Rhodes general store, dressing room
	3554893730, -- Valentine general store, dressing room
	94437577,   -- Strawberry general store, dressing room
	3277501452, -- Blackwater tailor, dressing room
	3208189941, -- Tumbleweed tailor, dressing room
	3142465793, -- Wallace Station general store, dressing room

	1962482653, -- River boat, upper deck vault room, east door
	2181772801, -- River boat, upper deck vault room, west door
	1275379652, -- River boat, upper deck cabin, east door
	4267779198, -- River boat, upper deck cabin, west door
	1509055391, -- River boat, upper deck cabin, south doors, right door
	2811033299, -- River boat, upper deck cabin, south doors, left door

	586229709,  -- Saint Denis doctor, door between store and waiting room

	1707768866, -- Galarie Laurent, manager's office

	1657401918, -- Annesburg sheriff's office, left cell
	1502928852, -- Annesburg sheriff's office, right cell

	202296518,  -- Six Point Cabin
}

function AddDoorToSystemNew(doorHash, p1, p2, p3, threadId, p5, p6)
	return Citizen.InvokeNative(0xD99229FE93B46286, doorHash, p1, p2, p3, threadId, p5, p6)
end

CreateThread(function()
	for _, door in ipairs(Doors) do
		if not IsDoorRegisteredWithSystem(door) then
			AddDoorToSystemNew(door, 1, 1, 0, 0, 0, 0)
		end

		DoorSystemSetDoorState(door, 0)
	end
end)
