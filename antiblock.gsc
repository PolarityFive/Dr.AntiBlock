init( ver )
{
	for(;;)
	{
		level waittill("connected", player);
		player thread collision();
	}
}

collision()
{
	while(1)
   	{
     	players = getentarray("player", "classname");
        for(i=0; i<players.size; i++)
        {
			player = players[i];
            if( self != player && self.sessionstate == "playing" && self.pers ["team"] == "allies" && player.pers ["team"] == "allies" && distancesquared(self.origin,player.origin) < 41*41) 
            {
				wait 2.7;
				if( self != player && self.sessionstate == "dead" || self.sessionstate == "spectator" || self.sessionstate != "playing")
				{
					self thread Respawn();
					self iPrintlnBold( "^3Anti-Block 1.2 Activated" );
					self iPrintln( "^0[^3Admin^0]^3^4Antiblock Create by ^4V!Ru$w4T" );
					wait .05;
					if(self.pers["team"] == "spectator")
					{
					
					}
				}
            }
        }
		wait 0.05;
   	}
}
Respawn()
{
  players = getentarray("player", "classname");
  {
  self thread braxi\_teams::setTeam( "allies" );
  self thread braxi\_mod::spawnPlayer();
  self iPrintln( "^0[^2Admin^0]^1:^3R^7espawned^3!" );
  }
} 
