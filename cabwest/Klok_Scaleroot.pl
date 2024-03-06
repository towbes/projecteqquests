
sub EVENT_SAY {
# Warrior Pike 7
 if($text =~ /Hail/i) {
    quest::say("What's that? Oh, I'm sorry I've been preoccupied with the recent [attacks] as of late.");
 }

 if($text =~ /attacks/i) {
    quest::say("You don't know? I thought everyone was aware now. It seems as though, there have been [mercenaries] doing horrible things to the city.");
 }


 if($text =~ /mercenaries/i) {
    quest::say("They wear the bands of Xyzith's troop. Unfortunately, War Baron Eator doesn't believe that the situation has gotten this bad. If only someone was able to find a way to [help] show him how bad the issue is.");
 }

 if($text =~ /help/i) {
    quest::say("Will you now? That is good. Bring me the bands and we will take it from there.");
 }
#End Warrior Pike 7

}

sub EVENT_ITEM {
# Warrior Pike 7
 if(plugin::check_handin(\%itemcount, 48022 => 1, 48023 => 1, 48024 => 1)){ #Band of the Chosen 1 2 and 3
  quest::say("What's this? I see you have the proof that I have been looking for. Take this note and speak to Drill Master Kyg. Shie is a stubborn one but true to keeping the Legion safe.");
  quest::summonitem(48025); # Item: Klok Scaleroot's Note
  quest::exp(20000);
  quest::ding();
  quest::faction(444,20); # Faction: Swift Tails
  quest::faction(441,10); # Faction: Legion of Cabilis
 }
# End Warrior Pike 7
}