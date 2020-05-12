timerNumber = 0
timers = {}

function initUtil()
	tickStart = game.tick
end

function getTime()
	return game.tick-tickStart
end

function notNil(class, var)
	value = false
	pcall(function()
		if class[var]
		then
			value = true
		end
	end)
	return value
end

function toGameString(arg, aT, fT)
	if aT~=nil then asTable = aT else asTable = false end
	if fT~=nil then firstTable = fT else firstTable = true end
	argType = type(arg)
	if argType == "nil"
	then
		text = "error"
	elseif argType == "string" or argType == "boolean" or argType == "number"
	then
		text = tostring(arg) .. " "
	elseif argType == "function"
	then
		text = debug.getinfo(arg).name .. " "
	elseif notNil(arg, "x") and notNil(arg, "y") and not asTable
	then
		text = "Position: " .. arg.x .. ", " .. arg.y .. " "
	elseif notNil(arg, "destructible") and not asTable
	then
		text = "Entity: " .. arg.name .. " " .. "Type: " .. arg.type .. " " .. toGameString(arg.position)
	elseif notNil(arg, "collideswith") and not asTable
	then
		text = "Tile: " .. arg.name .. " "
	elseif notNil(arg, "valid") and not asTable
	then
		text = "Unknown "
		if arg.valid then text = text .. "Valid Object: " else text = text .. "Invalid Object: " end
		if notNil(arg, "name") then text = text .. arg.name .. " " end
		if notNil(arg, "type") then text = text .. "Type: " .. arg.type .. " " end
		if notNil(arg, "position") then text = text .. toGameString(arg.position) .. " " end
	elseif (notNil(arg, "name") or notNil(arg, "type") or notNil(arg, "position")) and not asTable
	then
		text = "Unknown: "
		if notNil(arg, "name") then text = text .. "Name: " .. arg.name .. " " end
		if notNil(arg, "type") then text = text .. "Type: " .. arg.type .. " " end
		if notNil(arg, "position") then text = text .. toGameString(arg.position) end
	elseif argType == "table"
	then
		text = ""
		if firstTable then text = "Table: " end
		text = text .. "{"
		iters = math.min(#arg, 3)
		for i=1, iters
		do
			text = text .. toGameString(arg[i])
			if i<iters then text = text .. ", " end
		end
		if #arg>4 then text = text .. ", ... " end
		if #arg>3 then text = text .. toGameString(arg[#arg], false, false) end
		text = text .. "}"
	end
	return text
end

function message(arg, dialog, asTable)
	if dialog
	then
		game.showmessagedialog{text = {toGameString(arg, asTable)}}
	else
		game.player.print(toGameString(arg, asTable))
	end
end

function waitToDo(ticks, func)
	timerNumber = timerNumber+1
	timers[timerNumber] = coroutine.create
	(
		function (timetowait, todo)
			local timeLeft = timetowait
			while timeLeft > 0
			do
				timeLeft = timeLeft-1
				coroutine.yield()
			end
			pcall(todo)
			timernumber = timernumber-1
		end
	)
	coroutine.resume(timers[timerNumber], ticks, func)
end

function stepTimers()
	if timerNumber>0
	then
		for i = 1, #timers
		do
			if coroutine.status(timers[i]) == "suspended"
			then
				
				coroutine.resume(timers[i])
			end
		end
	end
end

function moveTowards(start, direction, distance)
	mod = {}
	if direction == defines.direction.north
	then
		mod.x = 0
		mod.y = -1
	elseif direction == defines.direction.south
	then
		mod.x = 0
		mod.y = 1
	elseif direction == defines.direction.east
	then
		mod.x = 1
		mod.y = 0
	elseif direction == defines.direction.west
	then
		mod.x = -1
		mod.y = 0
	elseif direction == defines.direction["north-east"]
	then
		mod.x = 1
		mod.y = -1
	elseif direction == defines.direction["north-west"]
	then
		mod.x = -1
		mod.y = -1
	elseif direction == defines.direction["south-east"]
	then
		mod.x = 1
		mod.y = 1
	elseif direction == defines.direction["south-west"]
	then
		mod.x = -1
		mod.y = 1
	end
	newPosition = {x = start.x+mod.x*distance, y = start.y+mod.y*distance}
	return newPosition
end

function right(direction)
	return math.fmod(direction + 2, 8)
end

function left(direction)
	return math.fmod(direction + 6, 8)
end

function modPosition(position, modx, mody)
	local finish = position
	if modx then else modx = 0 end
	if mody then else mody = 0 end
	finish.x = position.x+modx
	finish.y = position.y+mody
	return finish
end

function areaAround(start, radius)
	newArea = {{start.x-radius, start.y-radius}, {start.x+radius, start.y+radius}}
	return newArea
end

function centerOfArea(area)
	position = {}
	position.x = (area.left_top.x-area.right_bottom.x)/2 + area.left_top.x
	position.y = (area.left_top.y-area.right_bottom.y)/2 + area.left_top.y
	return position
end

function positionInChunk(pos)
	return {math.modf(pos.x/32), math.modf(pos.y/32)}
end

function chunkArea(chunk)
	position1 = {x = chunk.x*32, y = chunk.y*32}
	position2 = {x = chunk.x*32+32, y = chunk.y*32+32}
	area = {lefttop = position1, rightbottom = position2}
	return area
end

function mergeTables(table1, table2)
	newTable = table1
	for i=1, #table2
	do
		table.insert(newTable, table2[i])
	end
	return newTable
end

function findEntitiesInGeneratedChunks(nameList)
	local entityList = {}
	for chunk in game.getchunks()
	do
		if game.ischunkgenerated(chunk)
		then
			for i=1, #nameList
			do
				local temp = game.findentitiesfiltered({area = chunkArea(chunk), name = nameList[i]})
				entityList = mergeTables(entityList, temp)
			end
		end
	end
	return entityList
end