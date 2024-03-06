sub EVENT_SPAWN {
	#Set a random timer between 5 and 40
	my $StartMove = int(rand(35)) + 5;
	
	if($npc->GetCleanName() =~/bat/i) {
		quest::settimer("roam", $StartMove);
	}
	if($npc->GetCleanName() =~/snake/i) {
		quest::settimer("roam", $StartMove);
	}
	if($npc->GetCleanName() =~/wolf/i) {
		quest::settimer("roam", $StartMove);
	}
	if($npc->GetCleanName() =~/bear/i) {
		quest::settimer("roam", $StartMove);
	}
	if($npc->GetNPCTypeID() =~/170027/i) {
		quest::settimer("roam2", $StartMove);
	}
	if($npc->GetCleanName() =~/rat/i) {
		quest::settimer("roam", $StartMove);
	}
	if($npc->GetCleanName() =~/sea/i) {
		quest::settimer("roam", $StartMove);
	}
	if($npc->GetCleanName() =~/undead/i) {
		quest::settimer("roam", $StartMove);
	}
	if($npc->GetCleanName() =~/Zandoi/i) {
		quest::settimer("roam2", $StartMove);
	}
}

sub EVENT_TIMER {
	if ($timer eq "roam") {
		quest::stoptimer("roam");
		my $randomX = quest::ChooseRandom(100..300);
		my $randomY = quest::ChooseRandom(100..300);
		plugin::RandomRoam($randomX, $randomY);
		my $NextMove = int(rand(45)) + 5;
		quest::settimer("roam", $NextMove);
	}
	
	if ($timer eq "roam2") {
		quest::stoptimer("roam2");
		my $randomX2 = quest::ChooseRandom(200..500);
		my $randomY2 = quest::ChooseRandom(200..500);
		plugin::RandomRoam($randomX2, $randomY2);
		my $NextMove2 = int(rand(45)) + 5;
		quest::settimer("roam2", $NextMove2);
	}
}


sub EVENT_DEATH_COMPLETE {
	my $items = quest::ChooseRandom(24957,24960,24962,24963,24965..24969,24972,24973,24975,24976,24980..24983); # unadorned plate/chain/leather and tattered silk.
	my $chance = quest::ChooseRandom(1..100); # 1% chance to get 1 unadorned plate/chain/leather or tattered silk item.
	my $chance2 = quest::ChooseRandom(1..100); # 0.1% chance to get a second drop
	my $chance3 = quest::ChooseRandom(1..100); # 0.02% chance to get a third drop. Should happen 1 in 5000 kills or so.
	
	if($npc->GetCleanName() =~/siren/i && $chance > 99) { # first chance
		quest::addloot($items);
		if ($chance2 > 90){ # second chance if first is successful.
			quest::addloot($items);
			if ($chance3 > 80){ # third chance if second is successful.
				quest::addloot($items);
			}
		}	
	}
}

