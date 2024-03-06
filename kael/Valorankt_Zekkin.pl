sub EVENT_AGGRO {
  quest::say("Your bones will be crushed by the Kromrif of Kael Drakkel!");
}

sub EVENT_DEATH_COMPLETE {
  quest::spawn2(113508,29,0,1129.75,-841.35,-118.35,107.75); # NPC: Doldigun Steinwielder who drops his head
}

#sub EVENT_DEATH_COMPLETE {
#  quest::signal(113553,0); # NPC: Throne
#}