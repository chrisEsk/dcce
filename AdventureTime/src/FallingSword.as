package  
{
	import org.flixel.*;
	
	public class FallingSword extends Enemy
	{
		
		public function FallingSword(x:Number, y:Number) 
		{
			super(x, y);
			this.loadGraphic(_assetFactory.getSpriteClass("enemysword"), false, false, 9, 39, true);
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
