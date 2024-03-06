sub EVENT_SPAWN_ZONE {
	
	if ($spawned_npc_id == 64001) {
		quest::signalwith(64076, 2); # signal a_harbinger_of_the_seas to depop
	}
	if ($spawned_npc_id == 64076) {
		quest::stoptimer("harbinger");
		quest::depop(64092);
	}
}

sub EVENT_DEATH_ZONE {
	
	if ($killed_npc_id == 64092 or $killed_npc_id == 64001) { #Swirlspine Guardian or Normal Phinigel Autropos
		quest::settimer("harbinger", 300);
	}
	
}
=cut
sub EVENT_SIGNAL {
	if ($signal == 1){
		quest::stoptimer("harbinger");
		quest::signalwith(64076); # signal a_harbinger_of_the_seas to stop timer for telling me its spawned.
	}
}
=cut
sub EVENT_TIMER {
	
	if ($timer eq "harbinger") {
		quest::stoptimer("harbinger");
		quest::spawn2(64076, 0, 0,136.44,-25.08,-264.59,469.75); #a_harbinger_of_the_seas
	}
	
}

