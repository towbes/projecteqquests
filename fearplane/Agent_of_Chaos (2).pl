#Agent of Chaos by Osious

sub EVENT_SAY {
my $harder = quest::saylink("harder",1);

  if ($text =~ /hail/i) {
	quest::say("Would you like to make the plane of fear $harder?");
	}
	
  if ($text =~ /harder/i){
	my $dz = quest::get_expedition();
	if (!$dz->HasLockout("Plane of Fear")) {
    quest::spawn2(72100, 0, 0, -163, 549, 18, 235); # npc: Cazic Thule
	quest::spawn2(72101, 0, 0, -245, -139, 1.5, 327); # npc: dracoliche
	quest::spawn2(72097, 0, 0, -358, -636, 135, 384); # npc: fright
	quest::spawn2(72098, 0, 0, -1201, -635, 148, 1); # npc: dread
	quest::spawn2(72099, 0, 0, -365, 199, 125, 261); # npc: terror
	quest::say("The Plane of Fear is now harder.");
	quest::depop(72004); # depop normal fright
	quest::depop(72000); # depop normal dread
	quest::depop(72002); # depop normal terror
	quest::depop(72090); # depop normal dracoliche
	quest::depop(72003); # depop normal cazic thule
    } else {
	quest::say("You cannot make the plane of fear harder, you are currently on a lockout timer.");
	}
  }
}