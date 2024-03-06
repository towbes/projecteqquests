my $expedition_name = "Crushbone, DVinn's Stronghold";
my $min_players     = 1;
my $max_players     = 6;
my $dz_zone         = "crushbone";
my $dz_version      = 0;
my $dz_duration     = 3600; # 1 hour

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
      $dz->SetCompass("gfaydark", 238.0, 987.0, -24.90); # pointing to guard pineshade
      $dz->SetSafeReturn("gfaydark", 245.84, 987.93, -27.6, 484.0); # orc lift in gfay
      $dz->SetZoneInLocation(152.09, -625.61, 3.13, 82.25); # zone entrance
      $dz->AddReplayLockout(2200); # immediately add a 2 hour replay lockout on creation
      quest::say("Tell me when you're [" . quest::saylink("ready") . "] to enter");
    }
  }
  elsif ($text =~ /ready/i) {
    $client->MovePCDynamicZone("crushbone");
  }
}