package  
{
	import org.flixel.*;
	
	public class Jake extends Playable
	{
		
		public function Jake(X:Number, Y:Number) 
		{
			super(X, Y);
			
			loadGraphic(_assetFactory.getSpriteClass("jakePNG"), true, true, 15, 23, true);
			addAnimation("idle", [4], 0, false);
			addAnimation("walk", [1, 2, 3], 10, true);
			addAnimation("jump", [0], 0, false);
			addAnimation("hurt", [1], 0, false);
		}
		
	}

}