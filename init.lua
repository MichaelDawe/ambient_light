local level = tonumber(minetest.settings:get("light_level")) or 4

minetest.register_on_mods_loaded(function ()
	for i, def in pairs(minetest.registered_nodes) do
		local light_source = def.light_source
		if def.drawtype ~= "airlike" and (light_source == nil or light_source < level) then
			minetest.override_item(i, { light_source = level })
		end
	end
end)
