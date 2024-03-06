#Portal by Osirous

sub EVENT_SPAWN {
    #:: Create a proximity, 100 units across, 100 units tall, without proximity say
    quest::set_proximity($x - 30, $x + 30, $y - 15, $y + 15, $z - 15, $z + 15, 0);
	quest::settimer("depop", 60);
}

sub EVENT_ENTER {
  $client->MovePC(467, 816, -3232, -44, 495); #oceangreenvillage
}

sub EVENT_TIMER {

	if ($timer eq "depop"){
		quest::stoptimer("depop");
		quest::signalwith(2000047, 1);
		quest::depop(2000048);
	}
	
}

