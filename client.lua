local doors = {
	[2642457609] = 0, -- Valentine bank, front entrance, left door
	[3886827663] = 0, -- Valentine bank, front entrance, right door
	[1340831050] = 0, -- Valentine bank, gate to tellers
	[576950805]  = 0, -- Valentine bank, vault door
	[3718620420] = 0, -- Valentine bank, door behind tellers
	[2343746133] = 0, -- Valentine bank, door to backrooms
	[2307914732] = 0, -- Valentine bank, back door
	[334467483]  = 0, -- Valentine bank, door to hall in vault antechamber

	[1733501235] = 0, -- Saint Denis bank, west entrance, right door
	[2158285782] = 0, -- Saint Denis bank, west entrance, left door
	[1634115439] = 0, -- Saint Denis bank, manager's office, right door
	[965922748]  = 0, -- Saint Denis bank, manager's office, left door
	[2817024187] = 0, -- Saint Denis bank, north entrance, left door
	[2089945615] = 0, -- Saint Denis bank, north entrance, right door
	[1751238140] = 0, -- Saint Denis bank, vault

	[531022111]  = 0, -- Blackwater bank, entrance
	[2817192481] = 0, -- Blackwater bank, office
	[2117902999] = 0, -- Blackwater bank, teller gate
	[1462330364] = 0, -- Blackwater bank, vault

	[3317756151] = 0, -- Rhodes bank, front entrance, left door
	[3088209306] = 0, -- Rhodes bank, front entrance, right door
	[2058564250] = 0, -- Rhodes bank, door to backrooms
	[1634148892] = 0, -- Rhodes bank, teller gate
	[3483244267] = 0, -- Rhodes bank, vault
	[3142122679] = 1, -- Rhodes bank, back entrance
	
	[2446974165] = 0, -- Rhodes saloon, bath room door

	[340151973]  = 0, -- Saint Denis theatre, right door
	[544106233]  = 0, -- Saint Denis theatre, left door
	[1457151494] = 0, -- Saint Denis theatre, behind counter, right door
	[1688533403] = 0, -- Saint Denis theatre, behind counter, left door

	[1239033969] = 0, -- Farm house outside emerald ranch, bedroom door

	[3074790964] = 0, -- Geddes ranch house

	[3101287960] = 0, -- Armadillo bank, front door
	[3550475905] = 0, -- Armadillo bank, teller gate
	[1366165179] = 0, -- Armadillo bank, back door

	[772977516]  = 0, -- Slaver catcher house, north door
	[527767089]  = 0, -- Slaver catcher house, south door

	[3804893186] = 0, -- Saint Denis tailor, dressing room
	[2432590327] = 0, -- Rhodes general store, dressing room
	[3554893730] = 0, -- Valentine general store, dressing room
	[94437577]   = 0, -- Strawberry general store, dressing room
	[3277501452] = 0, -- Blackwater tailor, dressing room
	[3208189941] = 0, -- Tumbleweed tailor, dressing room
	[3142465793] = 0, -- Wallace Station general store, dressing room

	[1962482653] = 0, -- River boat, upper deck vault room, east door
	[2181772801] = 0, -- River boat, upper deck vault room, west door
	[1275379652] = 0, -- River boat, upper deck cabin, east door
	[4267779198] = 0, -- River boat, upper deck cabin, west door
	[1509055391] = 0, -- River boat, upper deck cabin, south doors, right door
	[2811033299] = 0, -- River boat, upper deck cabin, south doors, left door

	[586229709]  = 0, -- Saint Denis doctor, door between store and waiting room

	[1707768866] = 0, -- Galarie Laurent, manager's office

	[1657401918] = 0, -- Annesburg sheriff's office, left cell
	[1502928852] = 0, -- Annesburg sheriff's office, right cell

	[202296518]  = 0, -- Six Point Cabin

	[3782668011] = 0, -- Aberdeen Pig Farm south door

	[1423877126] = 0, -- Tumbleweed bath room door
	[3013877606] = 0, -- Tumbleweed bath, side room door

	[553939906]  = 0, -- Shady Belle, upstairs, right door
	[357129292]  = 0, -- Shady Belle, upstairs, left door

	[1523300673] = 0, -- Blackwater bath, north door

	[1915401053] = 0, -- Saint Denis tram station, east counter door
	[187523632]  = 0, -- Saint Denis tram station, west counter door

	[2984805596] = 0, -- Tumbleweed jail, left cell door
	[2677989449] = 0, -- Tumbleweed jail, right cell door

	[1711767580] = 1, -- Saint Denis jail cell
}

function AddDoorToSystemNew(doorHash, p1, p2, p3, threadId, p5, p6)
	return Citizen.InvokeNative(0xD99229FE93B46286, doorHash, p1, p2, p3, threadId, p5, p6)
end

CreateThread(function()
	for door, state in pairs(doors) do
		if not IsDoorRegisteredWithSystem(door) then
			AddDoorToSystemNew(door, 1, 1, 0, 0, 0, 0)
		end

		DoorSystemSetDoorState(door, state)
	end
end)
