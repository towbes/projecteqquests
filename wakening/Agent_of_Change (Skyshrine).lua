local aoc_raid = {
    expedition = { name="Skyshrine", min_players=1, max_players=72},
    instance   = { zone="skyshrine", version=0, duration=eq.seconds("7d") }, -- zone lasts 7 days
    safereturn = { zone="wakening", x=4499.86, y=1487.36, z=-57.38, h=227.0 }, --outside portal
    zonein     = { x=1200.20, y=1214.37, z=3.75, h=13.5 }, --past maze at armor quest room since maze teleports take outside instance
}

function event_say(e)
	local dz = e.other:GetExpedition()
	if(e.message:findi("hail")) then
		if dz.valid and dz:GetZoneName() == aoc_raid.instance.zone then
			e.self:Say("Tell me when you're [" .. eq.say_link("ready") .. "] to enter")
		else
			e.self:Say("Would you like to [" .. eq.say_link("request") .. "] the expedition?")
		end
	elseif(e.message:findi("request")) then
		local dz = e.other:CreateExpedition(aoc_raid)
		dz:AddReplayLockout(eq.seconds("9h")) -- 9 hour lockout
		e.self:Say("Tell me when you're [" .. eq.say_link("ready") .. "] to enter")
	elseif(dz:GetZoneName() == aoc_raid.instance.zone and e.message:findi("ready")) then
		e.other:MovePCDynamicZone(aoc_raid.instance.zone)
	end
end