sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::emote("turns to you and snorts in anger. Some mucus lands on your cheek.");
        quest::say("Troopers! I thought I ordered you to keep all new recruits away from this chamber! Go, child. The War Baron of Cabilis has no time for games. See this intruder out!!");
 }
 if ($text=~/What memory of Sebilis?/i) {
   quest::emote("takes a step back and thinks to himself. Phlegm dribbles off his lips.");
   quest::say("The Memory of Sebilis. Kept within my personal chambers. They have been taken. Taken by some croakin' Forsaken no doubt!! You have been sent to me because you show excellent prowess. Find my Memory and bring it to me with your footman's pike.");
 }
 if ($text=~/brave trooper of the empire/i) {
   quest::say("So you are a trooper? Word of your deeds has been spreading through the legion. If you truly wield the pike of a trooper, then go and serve the garrisons of swamp, lake and woods. Report to the Warlord and tell him you are a [trooper reporting for duty]. Their recommendations and your trooper pike shall earn you the rank of legionnaire.");
 }
 
# Warrior Pike 7
 my $key1 = $client->CharacterID() . "-kygturnin";
 my $value1 = quest::get_data($key1);
 if ($text=~/share our findings/i && $value1 == 1) { # checks for the databucket so the quest cant be skipped to this point
   quest::say("It seems we have no clue as to why Xyzith turned against us. We need you to find where he traveled and get down to the bottom of this mystery. Go speak to Geot. He was the closest to Xyzith. He may remember where Xyzith searched for the legendary metal.");
 }
# End Warrior Pike 7
}

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 18464 => 1, 22919 => 1)){
  quest::emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
  quest::summonitem(7881); # Item: Mark of Clarity
  quest::exp(20000);
  quest::ding();
  quest::faction(444,20); # Faction: Swift Tails
  quest::faction(441,10); # Faction: Legion of Cabilis
 }
 if(plugin::check_handin(\%itemcount, 18463 => 1, 22918 => 1)){
  quest::emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
  quest::summonitem(7881); # Item: Mark of Clarity
  quest::exp(20000);
  quest::ding();
  quest::faction(444,20); # Faction: Swift Tails
  quest::faction(441,10); # Faction: Legion of Cabilis
 }
     if (plugin::check_handin(\%itemcount, 12899 =>1, 12898 =>1, 12896 =>1, 5132 =>1 )) {
  quest::emote("gulps down a wad of phlegm.");
  quest::say("My memory has returned! Boneripper! You are no footman. I grant you the rank of soldier. Go and forge your weapon. Do not return to me until you become a [brave trooper of the empire].");
  quest::say("Find Drill Master Kyg to help you in this task?  [Footman Moglok] needs help.");    #not live text, link to 4th pike beginning
  quest::summonitem(12476); # Item: Soldier Head Plans
  quest::faction( 440,2); # Faction: Cabilis Residents
   quest::faction( 441,2); # Faction: Legion of Cabilis
   quest::faction( 445,2); # Faction: Scaled Mystics
   quest::faction( 444,2); # Faction: Swift Tails
   quest::faction( 442,2); # Faction: Crusaders of Greenmist
   quest::ding();
   quest::exp(800);
}
if (plugin::check_handin(\%itemcount, 18073 => 1, 18072 => 1, 18074 => 1, 5134 => 1 )) {
   quest::emote("takes away your pike and hands you plans not for a pike head, but for the crown of another polearm.");
  quest::say("It is time to wield the weapon of a [true warrior of the legion]. You have done well, Legionnaire $name!");
  quest::summonitem(12478); # Item: Legionnaire Crown Plans
  quest::faction( 440,2); # Faction: Cabilis Residents
   quest::faction( 441,2); # Faction: Legion of Cabilis
   quest::faction( 445,2); # Faction: Scaled Mystics
   quest::faction( 444,2); # Faction: Swift Tails
   quest::faction( 442,2); # Faction: Crusaders of Greenmist
   quest::ding();
   quest::exp(4000);
}

# Warrior Pike 7
if (plugin::check_handin(\%itemcount, 48026 => 1)) { # Item: Kyg's Approval
    quest::say("Ah, I see you have gained the approval of another. I suppose you are the one I should [share our findings] with then.");
     if(!defined($client->CharacterID() . "-kygturnin") == 1){ # need to define the databucket first so that it is added to the database. The reason for this is because I found that it wasnt always setting the databucket when it didnt exist.
		quest::set_data($client->CharacterID() . "-kygturnin", 0);
	}
	quest::set_data($client->CharacterID() . "-kygturnin", 1); # sets the databucket for the turn in so the quest can be contiuned.
}

if (plugin::check_handin(\%itemcount, 48020 => 1)) { # Seal of Rixiz
    quest::say("What is this?! This cannot be true. What has happened to Xyzith to make him so against those he served so proudly? I must get to the bottom of this. I shall however reward you for courage against him. Take this and replace that which you have defeated.");
	quest::summonitem(12481); #Item: Warlord Crown Plans
	quest::faction( 440,2); # Faction: Cabilis Residents
    quest::faction( 441,2); # Faction: Legion of Cabilis
    quest::faction( 445,2); # Faction: Scaled Mystics
    quest::faction( 444,2); # Faction: Swift Tails
    quest::faction( 442,2); # Faction: Crusaders of Greenmist
    quest::ding();
    quest::exp(44000);
}

# End Warrior Pike 7

# Warrior Pike 8
if (plugin::check_handin(\%itemcount, 48030 => 1)) { #  Xyzith's Spirit
    quest::say("I see you have figured out the issue and ended it as well. The Legion. . .no. . .I owe you much thanks. It is regretful that Xyzith did not come back to us safely, but we will all be in good hands with you here. Take these plans for the Pride of the Legion, and protect those as Warlord Xyzith did. Speak to Weaponsmith Gurgl to learn how to make your weapon of great power.");
	quest::summonitem(12482); #Item: Pride of the Legeion Plans
    quest::faction( 440,2); # Faction: Cabilis Residents
    quest::faction( 441,2); # Faction: Legion of Cabilis
    quest::faction( 445,2); # Faction: Scaled Mystics
    quest::faction( 444,2); # Faction: Swift Tails
    quest::faction( 442,2); # Faction: Crusaders of Greenmist
    quest::ding();
    quest::exp(64000);
}
# End Warrior Pike 8

#do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
