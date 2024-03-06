# a dire plague rat by Osirous

sub EVENT_SPAWN {
	my $time = int(rand(10)) + 1;
	quest::settimer("repop", $time);
	my $StartMove = int(rand(35)) + 5;
	quest::settimer("roam", $StartMove);
}


sub EVENT_TIMER {
	
	if ($timer eq "repop") {
		quest::stoptimer("repop");
		my $repopchance = quest::ChooseRandom(1..1000);
#		quest::shout("my chance to repop as a frenzied rolled $repopchance this time."); # this was used to test that it was working.
		if ($repopchance > 997) {
			quest::spawn2(124118, 0, 0,-838.55,-1941.92,-67.06,108);
			quest::depop();
		}
	}
	
	if ($timer eq "roam") {
		quest::stoptimer("roam");
		my $randomX = quest::ChooseRandom(100..300);
		my $randomY = quest::ChooseRandom(100..300);
		plugin::RandomRoam($randomX, $randomY);
		my $NextMove = int(rand(45)) + 5;
		quest::settimer("roam", $NextMove);
	}
	
}