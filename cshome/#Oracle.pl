sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings, adventurer, and welcome to the world of Norrath as well as the Aegis of Norrath server. This land is immense and remarkable, offering both excitement and peril. As an oracle with deep insights into this realm, I can furnish you with crucial information that is essential for your survival. Additionally, the Aegis of Norrath server has a lively community of players who are enthusiastic about welcoming you and sharing the adventures that await. Do you want to know [more]? 
");
}
if($text=~/More/i){
quest::say("With a playful tone, I wonder which topic you are most curious about? Are you itching to learn about the [rules] that govern this realm? Or perhaps you seek knowledge about the [quests] that await you? Maybe you're keen to explore the [hot zones], or delve deeper into the [details of the server] itself? Let me know, and I shall do my best to enlighten you!"); 
}

if($text=~/quest/i){
quest::say("Adventurer, I have limited information from the realm of gods, but I know that an undead knight of unrest holds a valuable item called the [Spectral Portal Shard]. It can instantly transport you back to this location whenever you look into it, making it an essential tool for your journey."); 
}

if($text=~/hot zones/i){
quest::say("Ah, I see you have a taste for adventure, my dear adventurer. If you are looking for the hottest zones in Everquest, look no further than [Mistmoore Castle] and the [Estate of Unrest]. These zones are renowned for their treacherous challenges and thrilling encounters, and if you dare to brave them, you shall be rewarded with double the experience. I also know an Unrest [quest] suited for a bold adventurer.  Are you Interested?"); 
}


if($text=~/Spectral/i){
quest::say("In the ancient times, the Spectral Portal Shard was a coveted artifact among the wizards and magicians of Norrath. It was said that the shard was created by a powerful wizard who had discovered a way to manipulate the very fabric of space and time. He imbued the shard with his vast knowledge and magic, and it was believed that whoever possessed the shard would gain immense power to create portals to other dimensions, and even travel through time itself. Shall I [continue]?"); 
}


if($text=~/continue/i){
quest::say("The shard's whereabouts were unknown for centuries until rumors started to spread that it was in the possession of an undead knight of unrest. The knight was known to be a powerful and cunning warrior, and he guarded the shard with his life. The Spectral Portal Shard became the most coveted artifact in Norrath, and many brave adventurers set out to try and obtain it. But none succeeded, and the knight remained the guardian of the shard for many years, vanquishing all who dared to challenge him. It is said that the Spectral Portal Shard still lies in the knight's possession, and that its power remains as strong as ever, waiting for the next adventurer brave enough to seek it out."); 
}

if($text=~/rules/i){
quest::say("Rules are boring, let's get them out of the way.  (1) let's all respect one another and enjoy ourselves! (2) Play fairly and avoid any cheating or exploiting of game mechanics. e.g, While MQ2 is permitted, warping and instant camping are not allowed. (3) Feel free to have up to 12 accounts online simultaneously."); 
}
if($text=~/details/i){
quest::say("Rules are boring, let's get them out of the way.  (1) let's all respect one another and enjoy ourselves! (2) Play fairly and avoid any cheating or exploiting of game mechanics. e.g, While MQ2 is permitted, warping and instant camping are not allowed. (3) Feel free to have up to 12 accounts online simultaneously."); 
}



}
