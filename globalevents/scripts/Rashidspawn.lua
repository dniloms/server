local config = {
	['Monday'] = Position(33038, 31323, 6),
	['Tuesday'] = Position(33038, 31323, 6),
	['Wednesday'] = Position(33038, 31323, 6),
	['Thursday'] = Position(33038, 31323, 6),
	['Friday'] = Position(33038, 31323, 6),
	['Saturday'] = Position(33038, 31323, 6),
	['Sunday'] = Position(33038, 31323, 6)
}

-- Should Rashid spawn as real tibia?
local spawnByDay = true

function onStartup()
	if spawnByDay then
		local npc = Game.createNpc('Rashid', config[os.date('%A')])
		if npc then
			npc:setMasterPos(config[os.date('%A')])
		end
	else
		local npc
		for _, position in pairs(config) do
			npc = Game.createNpc('Rashid', position)
			if npc then
				npc:setMasterPos(position)
			end
		end
	end

	return true
end