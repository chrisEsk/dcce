package  
{
	import org.flixel.*;
	
	public class Enemy extends FlxSprite
	{
		protected var level:StageLevel = new Level1();
		
		public function Enemy(x:Number, y:Number) 
		{
			super(x, y);
		}
		
	}
}
