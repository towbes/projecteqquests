sub EVENT_SAY {

  if($text =~ /Hail/i) {
    quest::say("Hello there yourself! If you don't mind I am quite busy here studying the rocks of this region.");
  }
# Warrior Pike 8 
  if($text =~/dark form/i) {
    quest::say("Well it slowly poisons the owner's mind eventually killing them. But it doesn't end at that, there's [more].");
  }
  if($text =~/more/i) {
    quest::say("Yes. . .I'm afraid it also traps the soul of the owner in the stone. I cannot perform the ritual any longer but I believe there is another that may be able to. I'm sorry I don't remember where to find him but you can ask around for him if you can't find him. His name is Liyx. Take your stone and find him. You will need it to summon the spirit to finally put him to rest properly.");
    quest::summonitem(48033); # Item: Black Stone 2
  }
# End Warrior Pike 8

}

sub EVENT_ITEM {
# Warrior Pike 8
if (plugin::check_handin(\%itemcount, 48029 => 1)) { # Item: Black Stone
	quest::say("Where did you find this? Never mind that, it doesn't matter. I hope you didn't have it for long. This stone has the power to drain the soul of the owner. In its pure form it can remove curses from creatures, but the one you have has been used already. In its [dark form] it does far worse.");
	quest::exp(10000);
	quest::faction(441,1); # Faction: Legion of Cabilis
    quest::faction(440,1); # Faction: Cabilis Residents
    quest::faction(445,1); # Faction: Scaled Mystics
    quest::faction(442,1); # Faction: Crusaders of Greenmist
    quest::faction(444,1); # Faction: Swift Tails
	}
# End Warrior Pike 8

}