package
{
	import org.flixel.*;
	
	public class Menu extends FlxSprite
	{
		
		public function Menu(X:Number, Y:Number)
		{
			super(X, Y);
			
			loadGraphic(_assetFactory.getSpriteClass("menuBG"), true, false, 320, 240);
			addAnimation("idle", [0, 1], 4, true);
		}
		
		override public function update():void
		{
			super.update();
			play("idle");
		}
		
	}
}
