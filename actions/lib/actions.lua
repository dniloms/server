function destroyItem(player, target, toPosition)
	if type(target) ~= "userdata" or not target:isItem() then
		return false
	end

	if target:hasAttribute(ITEM_ATTRIBUTE_UNIQUEID) or target:hasAttribute(ITEM_ATTRIBUTE_ACTIONID) then
		return false
	end

	if toPosition.x == CONTAINER_POSITION then
		player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		return true
	end

	local destroyId = ItemType(target.itemid):getDestroyId()
	if destroyId == 0 then
		return false
	end

	if math.random(7) == 1 then
		local item = Game.createItem(destroyId, 1, toPosition)
		if item then
			item:decay()
		end

		-- Move items outside the container
		if target:isContainer() then
			for i = target:getSize() - 1, 0, -1 do
				local containerItem = target:getItem(i)
				if containerItem then
					containerItem:moveTo(toPosition)
				end
			end
		end

		target:remove(1)
	end

	toPosition:sendMagicEffect(CONST_ME_POFF)
	return true
end

function getPoints(cid)
     local resultx = db.storeQuery("SELECT `points` FROM `accounts` WHERE `id` = "..getPlayerAccountId(cid))
     if resultx then
         points = result.getDataString(resultx, 'points')
         result.free(resultx)
         return points
     end
     return LUA_ERROR
end

function addPoints(cid, qt)
db.query("UPDATE `znote_accounts` SET `points` = `points` = "..getPoints(cid).."+"..qt.." WHERE `id` = "..getPlayerAccountId(cid)..";") 
end

function removePoints(cid, amount)
db.query("UPDATE `znote_accounts` SET `points` = `points` = "..getPoints(cid).."-"..qt.." WHERE `id` = "..getPlayerAccountId(cid)..";")
end