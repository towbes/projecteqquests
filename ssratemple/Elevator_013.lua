--Elevator_013
--Not needed there is no entrance on second floor. Goes straight from 009 -> 014
local say_msg = "Tell me when you're [" .. eq.say_link("ready") .. "] to go to third floor"
local dest_loc =  { x=281, y=-479, z=280, h=0 }

function event_say(e)
	local instance_id = eq.get_zone_instance_id();
	if(e.message:findi("hail")) then
		e.self:Say(say_msg)
	elseif(e.message:findi("ready")) then
		e.other:MovePCInstance(162,instance_id, dest_loc.x,dest_loc.y,dest_loc.z,0);
	end
end