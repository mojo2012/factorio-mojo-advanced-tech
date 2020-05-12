-- circuit boards
data:extend({
	{ -- tungsten
		type = "recipe",
		name = "tungsten-wire",
		enabled = false,
		energy_required = 3,
		ingredients = {
			{"tungsten-plate", 1}
		},
		results = {
			{"tungsten-wire", 5}
		}
	},
	{
		type = "recipe",
		name = "basic-electronic-components",
		enabled = "true",
		energy_required = 1.2,
		ingredients = {
			{"copper-cable", 2},
			{"coal", 2},
		},
		result = "basic-electronic-components"
	},
	{
		type = "recipe",
		name = "electronic-components",
		enabled = "true",
		energy_required = 1.3,
		ingredients = {
			{"copper-cable", 3},
			{"plastic-bar", 1},
		},
		result = "electronic-components"
	},
	{
		type = "recipe",
		name = "basic-circuit-board",
		enabled = "true",
		energy_required = 1.8,
		ingredients = {
			{"wood", 1},
			{"copper-cable", 5},
		},
		result = "basic-circuit-board"
	},
})

getRecipe("green-wire")["ingredients"] = {
	{"plastic-bar", 1},
	{"copper-cable", 1},
}

getRecipe("red-wire")["ingredients"] = {
	{"plastic-bar", 1},
	{"copper-cable", 2},
	{"green-wire", 4},
}

getRecipe("electronic-circuit")["ingredients"] = {
	{ "basic-circuit-board", 5 },
	{ "basic-electronic-components", 20 },
	{ "copper-cable", 5 },
}

getRecipe("advanced-circuit")["ingredients"] = {
	{ "electronic-circuit", 2 },
	{ "basic-electronic-components", 20 },
	{ "plastic-bar", 2 },
	{ "gold-plate", 2 },
	{ "nickel-plate", 2 },
	{ "silver-plate", 1 },
}

getRecipe("processing-unit")["ingredients"] = {
	{type = "fluid", name = "sulfuric-acid", amount = 0.5},
	{ "electronic-circuit", 20 },
	{ "electronic-components", 10 },
	{ "advanced-circuit", 3 },
	{ "tin-plate", 2 },
}

-- furnice
getRecipe("electric-furnace")["ingredients"] = {
	{"steel-plate", 15},
	{"advanced-circuit", 5},
	{"stone-brick", 10},
	{"titanium-plate", 3},
}

-- assembling machine
getRecipe("assembling-machine-3")["ingredients"] = {
	{"speed-module", 4},
	{"assembling-machine-2", 2},
	{"glass-plate", 10},
}

-- lighing
getRecipe("small-lamp")["ingredients"] = {
	{"electronic-circuit", 1},
	{"iron-stick", 3},
	{"iron-plate", 1},
	{"cut-glass", 2},
	{"tungsten-wire", 2},
}

getRecipe("rail-signal")["ingredients"] = {
	{"electronic-circuit", 1},
	{"small-lamp", 2},
	{"iron-plate", 5},
}

-- laser tower
getRecipe("laser-turret")["ingredients"] = {
	{"steel-plate", 20},
	{"electronic-circuit", 20},
	{"battery", 12},
	{"cut-glass", 2},
}

-- vehicles
getRecipe("diesel-locomotive")["ingredients"] = {
	{"engine-unit", 20},
	{"electronic-circuit", 10},
	{"steel-plate", 30},
	{"small-lamp", 4},
	{"glass-plate", 2},
}

getRecipe("car")["ingredients"] = {
	{"engine-unit", 8},
	{"iron-plate", 20},
	{"steel-plate", 5},
	{"aluminium-plate", 10},
	{"small-lamp", 4},
	{"glass-plate", 4},
}


-- robots
getRecipe("flying-robot-frame")["ingredients"] = {
	{"electric-engine-unit", 1},
	{"battery", 2},
	{"steel-plate", 1},
	{"aluminium-plate", 1},
	{"electronic-circuit", 3}
}

-- battery
getRecipe("battery")["ingredients"] = {
	{type="fluid", name="sulfuric-acid", amount=2},
	{"iron-plate", 1},
	{"copper-plate", 1},
	{"lead-plate", 1},
	{"zinc-plate", 1},
}

-- radar
getRecipe("radar")["ingredients"] = {
	{ "electronic-circuit", 5},
	{ "iron-gear-wheel", 5},
	{ "iron-plate", 10},
	{ "aluminium-plate", 5},
}

-- bullets and rockets
getRecipe("piercing-rounds-magazine")["ingredients"] = {
	{"copper-plate", 5},
	{"lead-plate", 1},
}

getRecipe("piercing-shotgun-shell")["ingredients"] = {
	{"copper-plate", 2},
	{"lead-plate", 1},
}

-- solar panel
getRecipe("solar-panel")["ingredients"] = {
	{"steel-plate", 5},
	{"electronic-circuit", 15},
	{"copper-plate", 5},
	{"titanium-plate", 5},
}

-- gates
getRecipe("gate")["ingredients"] = {
	{"stone-wall", 1},
	{"steel-plate", 2},
	{"electronic-circuit", 2},
	{"small-lamp", 2},
}
