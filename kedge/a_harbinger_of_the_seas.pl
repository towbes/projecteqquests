=cut
sub EVENT_SPAWN {
	quest::settimer("stop", 60);
}
=cut
sub EVENT_SAY {
	if ($text=~/hail/i) {
		if($class eq "Magician" or $class eq "Rogue" or $class eq "Bard" or $class eq "Wizard"){
		quest::emote(" looks through you and brushes her flowing hair to one side. It swirls and sways like sea kelp in the frigid waters.");
		quest::say("Phinigel Autropos, the last of his kind, child of the Ocean Lord Prexus, is not here. However, he will return for you if you wish it. Are you [prepared to face Phinigel]?");
		}
		else {
			quest::emote(" looks through you and brushes her flowing hair to one side. It swirls and sways like sea kelp in the frigid waters.");
			quest::say("Phinigel Autropos, the last of his kind, child of the Ocean Lord Prexus, is not here. Perhaps he will return.");
		}
	}
	
	if ($text=~/prepared/i){
		if($class eq "Magician"){
			quest::emote(" proclaims loudly, a great churning, gurgling sound nearly drowning out her natural melodic timbre, 'A challenger seeks to test her mettle against Phinigel Autropos!'");
			quest::spawn2(64057, 0, 0,136.44,-25.08,-264.59,469.75); #phinny with mage epic item only
			quest::depop();
		}
		elsif($class eq "Rogue"){
			quest::emote(" proclaims loudly, a great churning, gurgling sound nearly drowning out her natural melodic timbre, 'A challenger seeks to test her mettle against Phinigel Autropos!'");
			quest::spawn2(64059, 0, 0,136.44,-25.08,-264.59,469.75); #phinny with rogue epic item only
			quest::depop();
		}
		elsif($class eq "Bard"){
			quest::emote(" proclaims loudly, a great churning, gurgling sound nearly drowning out her natural melodic timbre, 'A challenger seeks to test her mettle against Phinigel Autropos!'");
			quest::spawn2(64060, 0, 0,136.44,-25.08,-264.59,469.75); #phinny with bard epic item only
			quest::depop();
		}
		elsif($class eq "Wizard"){
			quest::emote(" proclaims loudly, a great churning, gurgling sound nearly drowning out her natural melodic timbre, 'A challenger seeks to test her mettle against Phinigel Autropos!'");
			quest::spawn2(64065, 0, 0,136.44,-25.08,-264.59,469.75); #phinny with wizard epic item only
			quest::depop();
		}
	}
}

=cut
sub EVENT_TIMER {
	
	if ($timer eq "stop"){
		quest::signalwith(10, 1);
	}
	
}
=cut

sub EVENT_SIGNAL {
=cut	
	if ($signal == 1){
		quest::stoptimer("stop");
	}
=cut
	if ($signal == 2){
		quest::depop();
	}
}