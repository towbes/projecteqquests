# this requires the Zone:UseZoneController rule to be enabled
my $initialized = 0;

sub Initialize {
  quest::debug("Initializing expedition");
  my $dz = quest::get_expedition();
  if ($dz) {
    # bind unique npc types to events to prevent any looting exploits
    $dz->SetLootEventByNPCTypeID(58032, "Emperor Crush"); # npc: Emperor_Crush
    $dz->SetLootEventByNPCTypeID(317109, "Ambassador Mata Muram"); # npc: Overlord_Mata_Muram

    # spawn any events that the expedition doesn't have a lockout for
    if (!$dz->HasLockout("Ambassador Mata Muram")) {
      quest::spawn2(317109, 0, 0, 130.78, -149.09, 88.70, 270.8); # npc: Overlord_Mata_Muram
    }
  }
}

sub EVENT_SPAWN_ZONE {
  # note: zone_controller spawns before expeditions can be cached, so we delay
  # expedition init until first npc spawns instead of using our EVENT_SPAWN
  if (!$initialized) {
    $initialized = 1; # set first to prevent infinite recursion from spawning npcs in init()
    Initialize();
  }

  if ($spawned_npc_id == 58032) { # npc: Emperor_Crush
    my $dz = quest::get_expedition();
    if ($dz && $dz->HasLockout("Emperor Crush")) {
      quest::depop(58032); # depop emperor crush due to lockout
    }
  }
}

sub EVENT_DEATH_ZONE {
  if ($killed_npc_id == 58032) { # npc: Emperor_Crush
    my $dz = quest::get_expedition();
    if ($dz) {
      $dz->AddLockout("Emperor Crush", 86400); # 1 day lockout
    }
  }
  elsif ($killed_npc_id == 317109) { # npc: Overlord_Mata_Muram
    my $dz = quest::get_expedition();
    if ($dz) {
      $dz->AddLockout("Ambassador Mata Muram", 604800); # 7 day lockout

      # spawn a chest and bind its spawn id to the event to prevent loot exploits
      my $chest_id = quest::spawn2(893, 0, 0, 130.78, -149.09, 88.70, 0);
      $dz->SetLootEventBySpawnID($chest_id, "Ambassador Mata Muram");
    }
  }
}