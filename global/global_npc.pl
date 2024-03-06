sub EVENT_SPAWN {
    if ($npc->GetOwnerID() > 0 && $entity_list->GetMobByID($npc->GetOwnerID())->IsClient()) {
        quest::settimer("Rename", 5);
    }
}

sub EVENT_TIMER {
    if ($timer eq "Rename") {
        quest::stoptimer("Rename");
        $entity_list->GetClientByID($npc->GetOwnerID())->SignalClient(2);
    }
}
=cut
sub EVENT_DEATH_COMPLETE {

my @bosses = (128090,128091,128092,128093,128045,128054,128053,127098,124010,124017,124008,124011,124074,124103); # Nanzata the Warder, Ventani the Warder, Tukaarak the Warder, Hraashna the Warder, The Final Arbiter, Master of the Guard, The Progenitor, Tunare, Aaryonar, Lord Vyemm, Lord Feshlak, Dagarn the Destroyer, Lord Kreizenn, Lord Koi`Doken
	
	if ($npc->GetNPCTypeID() == @bosses) {
		my $bucket_key = $npc->GetNPCTypeID() . "-death-count";
		if (!defined($npc->GetNPCTypeID() . "-death-count") == 1) {
			quest::set_data($bucket_key, 1);
		} else {
			quest::set_data($bucket_key, quest::get_data($bucket_key) + 1);
			}
	}
}