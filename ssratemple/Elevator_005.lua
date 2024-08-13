--Elevator_005
--Teleport from SSRA rhag second to third floor
local say_msg = "Tell me when you're [" .. eq.say_link("ready") .. "] to go to third floor"
local dest_loc =  { x=614, y=174, z=269, h=0 }

function event_say(e)
	local instance_id = eq.get_zone_instance_id();
	if(e.message:findi("hail")) then
		e.self:Say(say_msg)
	elseif(e.message:findi("ready")) then
		e.other:MovePCInstance(162,instance_id, dest_loc.x,dest_loc.y,dest_loc.z,0);
	end
end