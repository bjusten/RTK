set_spear_trap = {
	cast = function(player)
		local magic = 520
		if not player:canCast(1, 1, 0) then
			return
		end

		if (player.magic < magic) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

		player:addNPC(
			"SpearTrapNpc",
			player.m,
			player.x,
			player.y,
			2,
			0,
			0,
			player.ID
		)

		player.magic = player.magic - magic
		player:playSound(0)
		player:sendStatus()
		player:sendAction(6, 35)

		player:sendMinitext("You set a trap!")
	end,

	requirements = function(player)
		local level = 66
		local items = {"fine_rabbit_meat", 0}
		local itemAmounts = {3, 400}
		local description = "Set a spear trap."
		return level, items, itemAmounts, description
	end
}
