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
  }
} 
