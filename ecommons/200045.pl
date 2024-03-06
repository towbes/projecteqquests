sub EVENT_SPAWN    { 
    quest::set_proximity($x - 15,$x + 15,$y - 15,$y + 15,$z - 15,$z + 15);
    $npc->TempName("");
} 

sub EVENT_ENTER {
    quest::movepc(151,-824,1189.69,1.66); # Zone: bazaar move them back to banker denton
    if($status > 100) {
        $client->Message(15, "DEBUG: You have entered a proximity!");
    }
}