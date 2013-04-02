package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class Enemy extends FlxSprite
	{
		[Embed(source = '../assets/sword.png')] private var enemy:Class;
		
		public function Enemy(x:Number, y:Number) 
		{
			super(x, y);
			this.loadGraphic(enemy, true, true, 11, 42, true);
			addAnimation("idle", [0], 0, false);
			this.play("idle");	
			velocity.y = 150;
			
		}
		
		override public function update():void
		{
			if (y > FlxG.height)
			{
				x = Math.random() * FlxG.height - width;
				y = Math.random() * - 700 - height;
			}
		}
		
		
	}

}