package  
{
	import org.flixel.*;
	
	public class Enemy extends FlxSprite
	{
		[Embed(source = '../assets/sword.png')] private var enemy:Class;
		
		private var level:Level1 = new Level1;
		
		public function Enemy(x:Number, y:Number) 
		{
			super(x, y);
			this.loadGraphic(enemy, false, false, 9, 39, true);
			addAnimation("idle", [0], 0, false);
			this.play("idle");	
			velocity.y = 140;
			
		}
		
		override public function update():void
		{
			if (y > level.height)
			{
				x = Math.random() * Math.random() * level.width ;
				y = Math.random() * Math.random() * level.height - 500 ;
			}
		}
		
	}
}
