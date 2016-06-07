-- basic circuit board
data:extend({
	{
		type = "item",
		name = "basic-electronic-components",
		icon = "__mojo-advanced-tech__/graphics/icons/basic-electronic-components.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "c[basic-electronic-components]",
		stack_size = 200
	},
	{
		type = "item",
		name = "electronic-components",
		icon = "__mojo-advanced-tech__/graphics/icons/electronic-components.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "c[electronic-components]",
		stack_size = 200
	},
	{
		type = "item",
		name = "basic-circuit-board",
		icon = "__mojo-advanced-tech__/graphics/icons/basic-circuit-board.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "c[basic-circuit-board]",
		stack_size = 200
	},
})