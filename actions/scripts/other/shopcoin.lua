local points = 1
function onUse(player, item, fromPosition, itemEx, toPosition)	
		db.query("UPDATE `znote_accounts` SET `points` = `points` + "..points.." WHERE id=" ..player:getAccountId() - 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Você recebeu '..points..' Shop points!')
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		Item(item.uid):remove(1)
	return true
end