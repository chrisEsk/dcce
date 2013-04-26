package  
{
	import org.flixel.*;
	
	public class Finn extends Playable
	{
		
		public function Finn(X:Number, Y:Number) 
		{
			super(X, Y);
			
			loadGraphic(_assetFactory.getSpriteClass("finnPNG"), true, true, 16, 25, true);
			addAnimation("idle", [0], 0, false);
			addAnimation("walk", [3, 4, 5], 10, true);
			addAnimation("jump", [2], 0, false);
			addAnimation("hurt", [1], 0, false);
		}
		
	}

}