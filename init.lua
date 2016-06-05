local load_time_start = minetest.get_us_time()

-- side length [m]
local size = 4.4

local box = {{}, {}}
for i = 1,6 do
	local v = 0.5 * math.sign(i - 3.5)
	box[1][i] = v
	box[2][i] = v / size
end

minetest.register_node("regelblock:block", {
	description = "Rules",
	tiles = {"regelblock.png"},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = box
	},
	paramtype = "light",
	visual_scale = size,
	drop = "",
	groups = {not_in_creative_inventory = 1, cracky = 3}
})


local time = (minetest.get_us_time() - load_time_start) / 1000000
local msg = "[regelblock] loaded after ca. " .. time .. " seconds."
if time > 0.01 then
	print(msg)
else
	minetest.log("info", msg)
end
