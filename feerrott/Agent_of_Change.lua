local fearplane_raid = {
    expedition = { name="Plane of Fear", min_players=1, max_players=40},
    instance   = { zone="fearplane", version=0, duration=eq.seconds("8h") }, -- zone lasts 8 hours
    safereturn = { zone="fearplane", x=2491, y=-2159.26, z=4, h=227.0 }, --outside portal
    zonein     = { x=1032, y=-834, z=100, h=260 },
}

function event_say(e)
	local dz = e.other:GetExpedition()
	if(e.message:findi("hail")) then
		if dz.valid and dz:GetZoneName() == "fearplane" then
			e.self:Say("Tell me when you're [" .. eq.say_link("ready") .. "] to enter")
		else
			e.self:Say("Would you like to [" .. eq.say_link("request") .. "] the expedition?")
		end
	elseif(e.message:findi("request")) then
		local dz = e.other:CreateExpedition(fearplane_raid)
		dz:AddReplayLockout(eq.seconds("9h")) -- 9 hour lockout
		e.self:Say("Tell me when you're [" .. eq.say_link("ready") .. "] to enter")
	elseif(dz:GetZoneName() == "fearplane" and e.message:findi("ready")) then
		e.other:MovePCDynamicZone("fearplane")
	end
end