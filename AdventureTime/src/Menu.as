package
{
	import org.flixel.*;
	
	public class Menu extends FlxSprite
	{
		[Embed(source = "../assets/menu.png")]
		protected var menuImg:Class;
		
		public function Menu(X:Number, Y:Number)
		{
			super(X, Y);
			
			loadGraphic(menuImg, true, false, 320, 240);
			addAnimation("idle", [0, 1], 4, true);
		}
		
		override public function update():void
		{
			super.update();
			play("idle");
		}
		
	}
}
