sub EVENT_SPAWN {
$x = $npc->GetX();
$y = $npc->GetY();
#Set proximity
quest::set_proximity($x - 100,$x + 10,$y - 20,$y + 20);

}

sub EVENT_ENTER{
quest::movepc(407,60,1206,-169,256);

} 