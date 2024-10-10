function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ".");
	end
end

function event_trade(e)
	local item_lib = require('items');
  
    if (item_lib.unattune(e, e.trade, {item1 = 42000})) then
		e.self:Say("that's it");
	end
	item_lib.return_items(e.self, e.other, e.trade);
  end
  