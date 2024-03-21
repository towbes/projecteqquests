#agent of change by osirous

my $expedition_name = "Lair of Lord Nagafen";
my $min_players     = 1;
my $max_players     = 40;
my $dz_zone         = "soldungb";
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
 #     $dz->SetCompass("gfaydark", 238.0, 987.0, -24.90); # pointing to guard pineshade
      $dz->SetSafeReturn("lavastorm", 561.44, 408.04, -45.10, 439.25); # orc lift in gfay
      $dz->SetZoneInLocation(-255.05, -425.00, -108.84, -258.74); # bridge in crushbone
      $dz->AddReplayLockout(32400); # immediately add a 9 hour (32,400 seconds) replay lockout on creation
      quest::say("Tell me when you're [" . quest::saylink("ready") . "] to enter");
    }
  }
  elsif ($text =~ /ready/i) {
    $client->MovePCDynamicZone("soldungb");
  }
}