#Beggar Norret by Osirous

sub EVENT_SPAWN {
    #:: Create a proximity, 100 units across, 100 units tall, without proximity say
    quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10, $z - 10, $z + 10, 0);
}

sub EVENT_ENTER {
  my $key = $client->CharacterID() . "-qeynospast";
  my $key_value = quest::get_data($key);
  if ($key_value > 0) {
	quest::settimer("portal", 5);
	quest::whisper("$name look there! The portal has returned!");
	} else {
		quest::say("Go AWAY! You are blocking my view!");
		quest::say("Unless you want to give me some coin...");
		quest::emote(" you almost missed his hand coming out of your pockets!");
		
	}
}

sub EVENT_TIMER {
	
	if ($timer eq "portal") {
	quest::stoptimer("portal");
	quest::doanim(64); # point
	quest::shout("I told you! I told you all!");
	quest::shout("Ha, HA! I was right! It does exist!");
	quest::spawn2(2000048, 0, 0, 28.12, -595.26, -13.29, 508.75);
	}
	
}

sub EVENT_SIGNAL {
	
	if ($signal == 1) {
	$npc->SetAppearance(3);
  }
}
