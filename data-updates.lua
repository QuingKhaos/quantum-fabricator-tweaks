local khaoslib_sprites = require("__khaoslib__.sprites")
local khaoslib_recipe = require("__khaoslib__.recipe")
local khaoslib_technology = require("__khaoslib__.technology")

-- Use provided graphics for storage reader constant combinator
data.raw["constant-combinator"]["qf-storage-reader"] = khaoslib_sprites.replace(data.raw["constant-combinator"]["qf-storage-reader"], {
  ["__base__/graphics/icons/constant-combinator.png"] = "__quantum-fabricator__/graphics/icons/digitizer-combinator.png",
})

data.raw["constant-combinator"]["qf-storage-reader"].sprites = khaoslib_sprites.replace(data.raw["constant-combinator"]["qf-storage-reader"].sprites, {
  ["__base__/graphics/entity/combinator/constant-combinator.png"] = "__quantum-fabricator__/graphics/entity/digitizer-combinator/hr-digitizer-combinator.png",
})

data.raw["item"]["qf-storage-reader"] = khaoslib_sprites.replace(data.raw["item"]["qf-storage-reader"], {
  ["__base__/graphics/icons/constant-combinator.png"] = "__quantum-fabricator__/graphics/icons/digitizer-combinator.png",
})

-- move combinator to circuit network tech if early digitizing chest is enabled
if settings.startup["qf-early-digitizing-chest"] then
  khaoslib_recipe:load("qf-storage-reader")
    :remove_unlock("matter-digitization")
    :add_unlock("circuit-network")
    :commit()

  khaoslib_technology:load("matter-dedigitization")
    :remove_prerequisite("matter-digitization")
    :commit()

  khaoslib_technology:load("matter-digitization")
    :remove()
end
