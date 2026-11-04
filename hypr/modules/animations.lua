---------------------------------
------ ANIMATIONS ---------------
---------------------------------

-- Opening: slower, smooth and fluid
hl.curve("open-curve", {
	type = "bezier",
	points = {
		{ 0.22, 0.65 },
		{ 0.36, 1.0 },
	},
})

-- Closing: smooth, with a gradual finish
hl.curve("close-curve", {
	type = "bezier",
	points = {
		{ 0.4, 0.0 },
		{ 0.2, 1.0 },
	},
})

-- General window animation
hl.animation({
	leaf = "windows",
	enabled = true,
	speed = 4,
	bezier = "open-curve",
	style = "slide top",
})

-- Window opening: from top
hl.animation({
	leaf = "windowsIn",
	enabled = true,
	speed = 4,
	bezier = "open-curve",
	style = "slide top",
})

-- Window closing: towards bottom
hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 3,
	bezier = "close-curve",
	style = "slide bottom",
})
