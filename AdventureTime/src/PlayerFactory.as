package  
{
	import org.flixel.*;
	
	public class PlayerFactory 
	{
		protected var player:Playable;
		
		public function PlayerFactory():void {}
		
		public function getPlayer(pplayer:String):Playable
		{
			if (pplayer == "Finn") 
			{
				player = new Finn(32, 100);
			}
			
			if (pplayer == "Jake") 
			{
				player = new Jake(32, 100);
			}
			
			return player;
		}
		
	}

}