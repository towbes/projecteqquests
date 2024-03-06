sub EVENT_CLICKDOOR {
	if($doorid == 70) {
	if($status < 255) {
		quest::movepc(151,-824,1189.69,1.66); # Zone: bazaar move them back to banker denton
    } else {
      $client->Message(13, "You are worthy to use this object!");
    }
}
	
}