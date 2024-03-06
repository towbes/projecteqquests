sub EVENT_SAY {
	
	if ($text=~/hail/i) {
		quest::emote(" eyes you for a moment before turning back toward the sea.");
		quest::say("Hello stranger, have you come to hear about the beast that roams these seas? Or did you come for some other reason?");
	}
	if ($text=~/soup/i) {
		quest::say("You've been speaking with my wife I see. Yeah, I promised to bring back the deep sea turtle soup. I've kept an eye on the horizon for any sign of that nasty beast... no telling when it will return! You see I can't cook the soup without it! Its body traps the deepest seawaters inside and if you were to slay it. You might be able to retreive some with a pod. Mix that in one of these turtle`s shells with about four bits of those wailing sea nymphs and Volia! You have a tasty deep sea turtle soup. Now if you do get one and bring it back to Fienna. I am sure she will reward you for your effort! Just don't eat it before you get it back to her.");
	}
	if ($text=~/wife/i){
		quest::say("Fienna. Yeah, thats my wife. She's up there at the house, sick in bed. It's been a few days now, but she'll be better soon.");
	}
}