require "stdlib.log.logger"
require "stdlib.event.event"

--config
require "config.config"

--some helper function
require("lib.helper")
require("lib.utilities")

-- specific event handling for the various sub parts of the mod

-- setup logger
global.logger = Logger.new("mojo-exploration", nil, Config.debug_mode, nil)



-- setup ancient ruins
function initialise()
	global.ar = {}

	global.ar.ruins = {
		["1"] = "ancient-ruin-1",
	}
end

function place_ruins(surface, position)
	surface.create_entity({
		name = "ancient-ruin-1", 
		amount = 1,
		position = {position.x + (10 * math.random()), (position.y + (15 * math.random()))}
	})
end


-- events
Event.register(Event.core_events.init, function()
	if global.ar == nil then
		initialise()
	end
end)

Event.register(Event.core_events.load, function()
	if global.ar == nil then
		initialise()
	end
end)

script.on_event(defines.events.on_player_created, function(event)
	global.logger.log("on_player_created start")
	local player = game.players[event.player_index]

	global.logger.log("on_player_created end")
end)

script.on_event(defines.events.on_chunk_generated, function(event)
	global.logger.log("on_chunk_generated start")

	local area = event.area
	local surface = event.surface
	
	resources = surface.find_entities_filtered({
		area = area,
		name ="ancient-ruin-placeholder"}
	)

	local alreadyPlaced = false

	if #resources > 0 then
		math.randomseed(game.tick)
		local rand = math.random(6)

		if not alreadyPlaced and rand == 2 then
			local chunkCenter = centerOfArea(area)

			place_ruins(surface, chunkCenter)

			global.logger.log("Found ruins ... placing ancient building at: " .. dump(resources[1].position))

			alreadyPlaced =  true
		end
	end

	

	global.logger.log("on_chunk_generated end")
end)