sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings!! You look like an adventurer. I have a bit of a problem with which you might be able to help. You see, there have been reports of sarnak hatchlings near the lake. I do not know why they are here, but I do know we need them exterminated. Here is the deal.. You bash them good and return their brains to me. For every four brains, I shall reward you.");
  }
  if ($text=~/trooper reporting for duty/i) {
    quest::say("Very good to have you on board, Trooper $name! We have had reports of sarnak legionnaires attacking caravans. I shall require you to find these sarnak legionnaires. Take this pack. Fill and combine it with as many of their brains as sill fit inside. Return the full pack to me and I shall consider you for a promotion.");
    quest::summonitem(17044); # Item: Lake Garrison Pack
  }
# Warrior Pike 7
  my $value1 = quest::get_data($client->CharacterID() . "-Xyzturnin"); #This is a databucket check
  if ($text=~/communicate/i && $value1 == 1){
    quest::say("That is a good question deserving of an answer. Go seek out members of brood with necromantic origin and see if any of them know how to [speak to the dead].");
	if(!defined($client->CharacterID() . "-Rixizflag") == 1){ # need to define the databucket first so that it is added to the database. The reason for this is because I found that it wasnt always setting the databucket when it didnt exist.
		quest::set_data($client->CharacterID() . "-Rixizflag", 0);
	}
	quest::set_data($client->CharacterID() . "-Rixizflag", 1);	# sets the databucket for the turn in so the quest can be contiuned.
  }
#End Warrior Pike 7
}


sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12914 =>1 )) {
    quest::say("Very good. I cannot see any reason a warrior like you should waste their time on the patrols of a trooper. I shall recommend you for a promotion. I hope the War Baron agrees.");
    quest::ding();
    quest::exp(2000);
    quest::summonitem(18074); # Item: Legionnaire Recommendation
    quest::faction(441,1); # Faction: Legion of Cabilis
    quest::faction(440,1); # Faction: Cabilis Residents
    quest::faction(445,1); # Faction: Scaled Mystics
    quest::faction(442,1); # Faction: Crusaders of Greenmist
    quest::faction(444,1); # Faction: Swift Tails
  }
  if (plugin::check_handin(\%itemcount, 12408 =>4 )) { 
    quest::say("Bravo!! You have done well. Here is a small reward. The greater reward is service to the empire.");
    quest::ding();
    quest::exp(3000);
    quest::faction(441,1); # Faction: Legion of Cabilis
    quest::faction(440,1); # Faction: Cabilis Residents
    quest::faction(445,1); # Faction: Scaled Mystics
    quest::faction(442,1); # Faction: Crusaders of Greenmist
    quest::faction(444,1); # Faction: Swift Tails
    quest::givecash(0,0,1,0);
    quest::summonitem(12614); # Item: Dried Froglok Leg
  }

# Warrior Pike 7
if (plugin::check_handin(\%itemcount, 48016 =>1 )) { # Item: Tattered Bracer
    quest::say("This was the bracer of Xyzith. . .I can only fear the worst now. Take this satchel with you. It was a gift from Xyzith when I first became a Warlord. Please find the rest of his remains and bring me the filled satchel again.");
    quest::summonitem(48016); # Item: Tattered Bracer
	quest::summonitem(48014); # Item: Geot's Pack
  }

my $value2 = quest::get_data($client->CharacterID() . "-Xyzturnin");
  
if (plugin::check_handin(\%itemcount, 48015 =>1) && ($value2 == 0 || !defined($client->CharacterID() . "-Xyzturnin"))) { # we check for the flag because this is where the infinite exp was on that other server.
	quest::say("I see you have found all of his belongings. If only we could find a way to [communicate] with him again to find out what information he found during his journey");
    if(!defined($client->CharacterID() . "-Xyzturnin") == 1){ # need to define the databucket first so that it is added to the database. The reason for this is because I found that it wasnt always setting the databucket when it didnt exist.
		quest::set_data($client->CharacterID() . "-Xyzturnin", 0);
	}
	quest::set_data($client->CharacterID() . "-Xyzturnin", 1);	# sets the databucket for the turn in so the quest can be contiuned.
	quest::exp(20000);
    quest::faction(441,1); # Faction: Legion of Cabilis
    quest::faction(440,1); # Faction: Cabilis Residents
    quest::faction(445,1); # Faction: Scaled Mystics
    quest::faction(442,1); # Faction: Crusaders of Greenmist
    quest::faction(444,1); # Faction: Swift Tails
	quest::summonitem(48015); #Item: Xyzith's Belongings
} else {
	quest::say("I no longer need to see Xyzith's Belongings, continue on to Master Rixiz now. . .");
	quest::summonitem(48015); #Item: Xyzith's Belongings
}
# End Warrior Pike 7

# Warrior Pike 8

if (plugin::check_handin(\%itemcount, 48027 => 1)) { # Item: Broken Medal
    quest::say("Where did you find this?! No matter. This was a present I gave Xyzith when he first left on his final mission. Hmm, it seems as though there is a stone hidden inside of it.");
    quest::say("Warlord Xyzith may have fallen inside of those mines but that still does not explain his recent actions. Maybe the stone will shed light on this situation. I knew a shaman that practiced the art of alchemy. Maybe she can recall what kind of stone this is. Take this stone and search for her.");
	quest::summonitem(48029); # Item: Black Stone
	quest::exp(10000);
    quest::faction(441,1); # Faction: Legion of Cabilis
    quest::faction(440,1); # Faction: Cabilis Residents
    quest::faction(445,1); # Faction: Scaled Mystics
    quest::faction(442,1); # Faction: Crusaders of Greenmist
    quest::faction(444,1); # Faction: Swift Tails
	}

#  End Warrior Pike 8
  
  plugin::return_items(\%itemcount);
}

