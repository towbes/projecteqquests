##Translocator_Gethia.pl
#Zone: ecommons

sub EVENT_SAY{
  if ($text=~/Hail/i){
  quest::say("Hello there, $name. You are quite the traveler. Welcome to Aegis of Norrath! Somehow you have transcended time and arrived in the future of our world.  Time traveler, I am with the Academy of Arane Sciences, here to help travelers like yourself.  I can transport you back to the correct date, to the city of your choosing.  I recommend you bind yourself when you arrive. The Hubzone for our world is [" . quest::saylink("ECTunnel") . "] in East Commonlands. Seek out the Oracle of Norrath when you arrive in ECTunnel for wisdom on this world. These are the cities I can help you travel to: 
  
  
[" . quest::saylink("MistyThicket") . "]
[" . quest::saylink("Greater Faydark") . "] 
[" . quest::saylink("North Qeynos") . "] 
[" . quest::saylink("West Freeport") . "]
[" . quest::saylink("MistyThicket") . "]
[" . quest::saylink("Toxxulia Forest") . "]
[" . quest::saylink("Neriak Commons") . "]
[" . quest::saylink("Innothule Swamp") . "]
[" . quest::saylink("The Feerrott") . "]
[" . quest::saylink("Halas") . "]
[" . quest::saylink("Steamfont Mountains") . "]
[" . quest::saylink("Butcherblock Mountains") . "]
[" . quest::saylink("Plane of Hate") . "]
");
  }
  
  if($text=~/ECTunnel/i)
  {
  quest::say("Fair winds and following seas, my friend. I wish you well on your journey. ");
  quest::movepc(22,-155.04,-1514.78,3.22);
  }
  
  if($text=~/Greater Faydark/i)
  {
  quest::say("Fair winds and following seas, my friend. I wish you well on your journey. ");
  quest::movepc(54,67.30,389.55,25.33);
  }
        
  if($text=~/North Qeynos/i)
  {
  quest::say("Fair winds and following seas, my friend. I wish you well on your journey. ");
 quest::movepc(2,196,700,700) ;
  }
        
  if($text=~/Halas/i)
  {
  quest::say("Fair winds and following seas, my friend. I wish you well on your journey. ");
 quest::movepc(30,673.33,3196.61,-60.77) ;
  }
				
  if($text=~/West Freeport/i)
  {
  quest::say("Off you go!");
quest::movepc(9,197.38,108.63,-21.03) ;
  }
  
  if($text=~/Mistythicket/i)
  {
  quest::say("Fair winds and following seas, my friend. I wish you well on your journey. ");
quest::movepc(415,-1085.45,255.99,11.48) ;
  }

  if($text=~/Toxxulia Forest/i)
  {
  quest::say("Fair winds and following seas, my friend. I wish you well on your journey. ");
quest::movepc(414,-937.57,2120.08,35.02) ;
  }

     if($text=~/Neriak Commons/i)
  {
  quest::say("Fair winds and following seas, my friend. I wish you well on your journey. ");
quest::movepc(41,157.33,-1.67,31.13) ;
  }

     if($text=~/Innothule Swamp/i)
  {
  quest::say("Fair winds and following seas, my friend. I wish you well on your journey. ");
quest::movepc(46,-170.46,-2590.76,-18.02) ;
  }  
  
     if($text=~/The Feerrott/i)
  {
  quest::say("Fair winds and following seas, my friend. I wish you well on your journey. ");
quest::movepc(47,239.81,1239.50,-0.48) ;
  }  

     if($text=~/Steamfont Mountains/i)
  {
  quest::say("Fair winds and following seas, my friend. I wish you well on your journey. ");
quest::movepc(56,554.70,-1603.22,-108.90) ;
  }  

     if($text=~/Butcherblock Mountai/i)
  {
  quest::say("Fair winds and following seas, my friend. I wish you well on your journey. ");
quest::movepc(68,-239.88,2889.88,-0.78) ;
  }    
  
      
  if($text=~/Plane of Hate/i)
  {
  quest::say("Fair winds and following seas, my friend. I wish you well on your journey. ");
  quest::movepc(76,-349.22,-387.16,3.13);
  }  
  
} 

