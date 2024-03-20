#agent of change by osirous

my $expedition_name = "Old Sebilis";
my $min_players     = 1;
my $max_players     = 40;
my $dz_zone         = "sebilis";
my $dz_version      = 0;
my $dz_duration     = 28800; # 8 hours | #3600; # 1 hour ::: 

sub EVENT_SAY {
  if ($text =~ /hail/i) {
    my $dz = $client->GetExpedition();
    if ($dz && $dz->GetName() eq $expedition_name) {
      quest::say("Tell me when you're [" . quest::saylink("ready") . "] to enter");
    }
    else {
      quest::say("Would you like to [" . quest::saylink("request") . "] the expedition?");
    }
  }
  elsif ($text =~ /request/i) {
    my $dz = $client->CreateExpedition($dz_zone, $dz_version, $dz_duration, $expedition_name, $min_players, $max_players);
    if ($dz) {
      $dz->SetSafeReturn("trakanon", -4698.87, -1608.98, -472.6, 114.0); # at the agent of change in trakanon
      $dz->SetZoneInLocation(-1, 248, 40, 257); # entrance to Sebilis
      $dz->AddReplayLockout(35000); # immediately add a 9 hour replay lockout on creation.  Temporarily removing lockout timer here 
      quest::say("Tell me when you're [" . quest::saylink("ready") . "] to enter");
    }
  }
  elsif ($text =~ /ready/i) {
	my $dz = quest::get_expedition();
    if ($dz && $dz->HasLockout("Trakanon")) {
		quest::say("You have recently slain Trakanon and can no longer enter this expedition until the timer has expired.");
	} else {
		$client->MovePCDynamicZone("sebilis");
	}
  }
}

=cut
	my $key = $client->CharacterID() . "-Old_Sebilis_DZ_Lockout";
	my $value = quest::get_data($key);

	if(!defined($client->CharacterID() . "-Old_Sebilis_DZ_Lockout") == 1){
		quest::set_data($key, 0);
	}

	if ($value == 0){
		quest::set_data($key, 1, 72000);