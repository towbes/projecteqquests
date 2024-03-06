--[[
function event_enter_zone(e)
  local client = eq.get_entity_list():GetClientByID(e.self:GetID());
  client:MovePC(22, -144, -1543, 2, 244); -- Zone: ecommons
end
]]

function event_enter_zone(e)
  local client = eq.get_entity_list():GetClientByID(e.self:GetID());
  local status = client:GetGMStatus();
	-- Check if the status is less than 251
	if status < 251 then
		-- Move the client to the specified coordinates
		client:MovePC(22, -144, -1543, 2, 244);
	end
end