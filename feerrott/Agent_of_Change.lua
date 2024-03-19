local fearplane_raid = {
    expedition = { name="Plane of Fear", min_players=1, max_players=40},
    instance   = { zone="fearplane", version=0, duration=eq.seconds("8h") },
    compass    = { zone="fearplane", x=-974.94, y=-1346.20, z=-500.81 },
    safereturn = { zone="fearplane", x=-1019.46, y=-1366.74, z=-492.12, h=256 },
    zonein     = { x=0, y=180, z=-4.12, h=256 }
}

function event_say(e)
	local dz = e.self:GetExpedition()
	if(e.message:findi("hail")) then
		if dz.valid and dz:GetZoneName() == "fearplane" then
			e.self:Say("Tell me when you're [" .. eq.saylink("ready") .. "] to enter")
		else
			e.self:Say("Would you like to [" .. eq.saylink("request") ... "] the expedition?")
		end
	elseif(e.message:findi("request")) then
		local dz = e.other:CreateExpedition(fearplane_raid)
	elseif(dz:GetZoneName() == "fearplane" and e.message:findi("ready")) then
		e.other:MovePCDynamicZone("fearplane")
	end
end