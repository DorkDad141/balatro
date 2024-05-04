--- STEAMODDED HEADER
--- MOD_NAME: Reroll Packs
--- MOD_ID: RerollPacks
--- MOD_AUTHOR: [DorkDad141]
--- MOD_DESCRIPTION: Rerolling the shop also rerolls packs

----------------------------------------------
------------MOD CODE -------------------------

local _reroll_shop = G.FUNCS.reroll_shop
function G.FUNCS.reroll_shop(e) 
	_reroll_shop(e)

	for i = #G.shop_booster.cards,1, -1 do
		local c = G.shop_booster:remove_card(G.shop_booster.cards[i])
		c:remove()
		c = nil
	end
	
	for i = 1, 2 do
		G.GAME.current_round.used_packs[i] = get_pack('shop_pack').key
		local card = Card(G.shop_booster.T.x + G.shop_booster.T.w/2,
		G.shop_booster.T.y, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[G.GAME.current_round.used_packs[i]], {bypass_discovery_center = true, bypass_discovery_ui = true})
		create_shop_card_ui(card, 'Booster', G.shop_booster)
		card.ability.booster_pos = i
		card:start_materialize()
		G.shop_booster:emplace(card)
	end
end

----------------------------------------------
------------MOD CODE END----------------------
