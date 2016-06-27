require "stdlib.log.logger"

--config
require "config.config"

--some helper function
require("lib.helper")

-- the actual modded game items
require("prototypes.tile.base")
require("prototypes.item.base")
require("prototypes.entity.base")
require("prototypes.recipe.base")
require("prototypes.technology.base")

-- some init stuff specific to the various sub parts of the mod
