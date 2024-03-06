#Hadden the fisherman by Osirous

sub EVENT_SAY {
	if ($status > 250) {
		if ($text=~/hail/i) {
			my $key = $client->CharacterID() . "-qeynospast";
			quest::set_data($key, 1);
			quest::whisper("Test key has been set.");
		}
	}
}


sub EVENT_ITEM {
	
	if (plugin::check_handin(\%itemcount, 147497 => 1)) {
    quest::emote("looks over the tome before flipping through the pages. His head rises to meet your gaze. His lips part as if to speak, but close tightly. He turns his head to the north staring for what feels like an eternity before meeting your eyes once again.'");
    quest::settimer("waiting", 20);
  }
	
	
}

sub EVENT_TIMER {
	if ($timer eq "waiting") {
    quest::stoptimer("waiting");    
    quest::whisper("A few years back, I heard this voice. It seemed distant and faint, but it called to me across the water. 'Near the wharf I wait for the doorway to appear. For when it does, it will take me back, back to where I am from.'");
	quest::whisper("This man, Brazz, he came as you have and I told him the same. However, after reading this tome it does not look like he gained any more understanding than I did. I wish you well in your endeavors $name. But, there is no wharf on this lake. You might try the port in Qeynos.");
	quest::emote(" shoulders rise and fall in a shrugging motion.");
	my $key = $client->CharacterID() . "-qeynospast";
	quest::set_data($key, 1);
  }
}