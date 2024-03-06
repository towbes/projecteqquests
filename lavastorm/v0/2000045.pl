sub EVENT_SPAWN {
    #:: Create a proximity, 100 units across, 100 units tall, without proximity say
    quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10, $z - 10, $z + 10, 0);
}

sub EVENT_ENTER {
  quest::movepc(80,7,260,2) ; temple sol ro
}