local aoc_raid = {
    expedition = { name="Veeshans Peak", min_players=1, max_players=72},
    instance   = { zone="veeshan", version=0, duration=eq.seconds("7d") }, -- zone lasts 8 hours
    safereturn = { zone="skyfire", x=2887.09, y=2679.29, z=-75.45, h=227.0 }, --outside portal
    zonein     = { x=1783.0, y=-5, z=11.5, h=260 },
	key = 20884
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
		if e.other:KeyRingCheck(aoc_raid.key) then
			local dz = e.other:CreateExpedition(aoc_raid)
			dz:AddReplayLockout(eq.seconds("1d")) -- 9 hour lockout
			e.self:Say("Tell me when you're [" .. eq.say_link("ready") .. "] to enter")
		else
			e.self:Say("You do not have the key")
		end
	elseif(dz:GetZoneName() == aoc_raid.instance.zone and e.message:findi("ready")) then
		if e.other:KeyRingCheck(aoc_raid.key) then
			e.other:MovePCDynamicZone(aoc_raid.instance.zone)
		else
			e.self:Say("You do not have the key")
		end
	end
end