
sub EVENT_SAY {

 if($text =~ /Hail/i) {
    quest::say("Hello. You have caught me before I started another mission. What can I do for you? Do you need my [aid]?");
 }
# Warrior Pike 8
 if($text=~/aid/i) {
    quest::say("If that is the case you must know what I specialize in. Bring me the stone, a mirrored gem, and two celestial essences. I will do the rest by helping you set your friend free.");
 } 
# End Warrior Pike 8
}


sub EVENT_ITEM {

# Warrior Pike 8
 if (plugin::check_handin(\%itemcount, 48033 => 1, 48028 => 1, 9650 => 2)){ # Item IDs in order - Black Stone 2, Mirrored Gem, 2x Celestial Essense
    quest::say("He is here now. Send him off to the next plane.");
	quest::exp(10000);
	my $PX = $client->GetX();
	my $PY = $client->GetY();
	my $PZ = $client->GetZ(); 
	quest::spawn(78029,0,0, $PX, $PY, $PZ); # Spawns Warlord Xyzith Skeletal Version on top of player. Should hit for a max of 150.
    quest::say("Now he is free. Take his essence which is now pure, and return to your Head Master. He will know what to do from here. As for me, I have other errands to tend to.");
	quest::emote("As Hierophant Liyx finishes his words, he steps into the shadows and departs again."); # As Hierophant Liyx might need to be removed from the text here.
    $npc->Depop();
 }
# End Warrior Pike 8
  plugin::return_items(\%itemcount);
}