data:extend({
	{
		type = "noise-layer",
		name = "ancient-ruin-placeholder"
	},
})


data:extend( {
	{
		type = "autoplace-control",
		name = "ancient-ruin-placeholder",
		richness = true,
		order = "b-a"
	},
	{
		type = "resource",
		name = "ancient-ruin-placeholder",
		icon = "__mojo-exploration__/graphics/empty.png",
		flags = {"placeable-neutral"},
		order="a-b-e",
		collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
		selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
		autoplace = {
			control = "ancient-ruin-placeholder",
			sharpness = 0.1,
			richness_multiplier = 1,
			richness_base = 1,
			size_control_multiplier = 0.06,
			richness_multiplier_distance_bonus = 1,
			--coverage = 0.01,
			peaks = {
				{
					noise_layer = "ancient-ruin-placeholder",
					noise_octaves_difference = -1,
					noise_persistence = 0.01,
				}
			},
		},
		stage_counts = {0},
		stages = {
			sheet = {
				filename = "__mojo-exploration__/graphics/debug.png",
				priority = "extra-high",
				width = 32,
				height = 32,
				frame_count = 1,
				direction_count = 1,
				variation_count = 1
			}
		},
		map_color = {r=0.250, g=0.000, b=0.140}
	},
})	

-- actual ruin entities
data:extend({
	{
	type = "container",
	name = "ancient-ruin-1",
	icon = "__base__/graphics/icons/steel-chest.png",
	flags = {"placeable-neutral", "player-creation"},
	minable = {mining_time = 1, result = "steel-chest"},
	order="d-a-a",
	max_health = 200,
	corpse = "small-remnants",
	open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
	close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
	resistances = {
		{
			type = "fire",
			percent = 90
		}
	},
	collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
	selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
	fast_replaceable_group = "container",
	inventory_size = 48,
	vehicle_impact_sound =	{ filename = "__base__/sound/car-stone-impact.ogg", volume = 0.65 },
	picture = {
		filename = "__mojo-exploration__/graphics/entity/ancient-ruin-1.png",
		priority = "extra-high",
		width = 200,
		height = 150,
		shift = {0.1875, 0}
	},
	},
})
