package  
{
	import org.flixel.*;
	
	public class Collectible extends FlxSprite
	{
		
		public function Collectible(X:int, Y:int, memoriePNG:Class)
		{
			super(X * 16, Y * 16, memoriePNG);
			
			solid = true;
		}
		
	}

}