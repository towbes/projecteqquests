sub EVENT_SPAWN {
	quest::set_proximity($x - 8, $x + 8, $y - 8, $y + 8, $z - 8, $z + 8, 0);
}

sub EVENT_TIMER {
	
	if ($timer eq "cough") {
		quest::stoptimer("cough");
		quest::emote(" coughs.");
		quest::emote(" looks to you as if to say something before laying her head back down.");
		quest::settimer("nextcough", quest::ChooseRandom(5..30));
	}
	
	if ($timer eq "nextcough") {
		quest::stoptimer("nextcough");
		quest::emote(" coughs.");
		quest::emote(" wipes her mouth with the back of her hand.");
	}
	
}

sub EVENT_ENTER {
	my $time = quest::ChooseRandom(1..5);
	quest::settimer("cough", $time);
}

sub EVENT_SAY {
	
	if ($text=~/hail/i) {
		quest::emote(" coughs.");
		quest::say("Oh, hello... would you mind telling my husband that I am ready for my soup?");
	}
	if ($text=~/soup/i) {
		quest::emote(" coughs.");
		quest::say("He was supposed to bring me a bowl of deep sea turtle soup.");
	}
	if ($text=~/husband/i){
		quest::emote(" turns her head slightly toward you.");
		quest::say("Daitin Cavanagh, he regularly hangs around the docks. He spends most of his time drinking and fishing... telling wild tales to any who will listen.");
	}
}

sub EVENT_ITEM{
	if (plugin::check_handin(\%itemcount, 147499 => 1) && $status > 250) { # Deep Sea Turtle Soup status check for now since its not finished. dont want people not getting an AA
		quest::ding();
		if($class eq "Magician"){
		$client->IncrementAA(15213); # Mana Reserve
		} elsif($class eq "Wizard"){
		$client->IncrementAA(7237); # Harvest of Druzzil Rank 3
		} elsif($class eq "Necromancer"){
		$client->IncrementAA(1510); # Blood Magic Rank 1
		} elsif($class eq "Enchanter"){
		$client->IncrementAA(1233); # Stasis
		} elsif($class eq "Warrior"){
		$client->IncrementAA(8303); # Rage of Rallos Zek
		} elsif($class eq "Monk"){
		$client->IncrementAA(1255); # Imitate Death
		} elsif($class eq "Rogue"){
		$client->IncrementAA(15625); # Assassin's Wrath 
		} elsif($class eq "Berserker"){
		$client->IncrementAA(1); #
		} elsif($class eq "Ranger"){
		$client->IncrementAA(1); #
		} elsif($class eq "Druid"){
		$client->IncrementAA(1498); # Nature's Guardian
		} elsif($class eq "Shaman"){
		$client->IncrementAA(1); #
		} elsif($class eq "Shadowknight"){
		$client->IncrementAA(1); #
		} elsif($class eq "Paladin"){
		$client->IncrementAA(1); #
		} elsif($class eq "Bard"){
		$client->IncrementAA(7010); # The Show Must Go On
		} elsif($class eq "Beastlord"){
		$client->IncrementAA(1); #
		} elsif($class eq "Cleric"){
		$client->IncrementAA(1); #
		}
		quest::say("Thank you $name for bringing my soup! Hopefully I will feel better soon!");
		quest::exp(10000);
	} else {
		quest::say("Thank you $name, but I cannot accept this at this time, bring the deep sea turtle soup back to me later on!");
		plugin::return_items(\%itemcount);
	}
}