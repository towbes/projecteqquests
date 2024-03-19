#agent of change by osirous

my $expedition_name = "Plane of Fear";
my $min_players     = 1;
my $max_players     = 40;
my $dz_zone         = "fearplane";
my $dz_version      = 0;
my $dz_duration     = 28800; # 8 hours | #3600; # 1 hour

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
      $dz->SetSafeReturn("feerrott", 2491, -2159.26, 4, 227.0); # outside portal
      $dz->SetZoneInLocation(1032, -834, 100, 260); # normal zone in place
      $dz->AddReplayLockout(32400); # immediately add a 9 hour replay lockout on creation
      quest::say("Tell me when you're [" . quest::saylink("ready") . "] to enter");
    }
  }
  elsif ($text =~ /ready/i) {
    $client->MovePCDynamicZone("fearplane");
  }
}