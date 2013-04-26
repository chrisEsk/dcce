package  
{
	import org.flixel.FlxState;
	import org.flixel.*;

	public class CreditsState extends FlxState
	{	
		protected var info:FlxText;
		protected var actualInfo:String;
		protected var backToMenu:FlxButton;
		protected var gunter:FlxSprite;
		
		override public function create():void
		{
			super.create();
			
			FlxG.mouse.show();
			
			actualInfo = "Developers: \n- Chris Esquivel (@ChrisEsk) \n- Daniel Castro";
			actualInfo += "\n\nFind the code of this game here: \ngithub.com/chrisEsk/dcce";
			actualInfo += "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nUniversidad Cenfotec";
			
			info = new FlxText(0, 0, 320);
			
			info.color = 0xffffffff;
			info.shadow = 0xff000000;
			info.text = actualInfo;
			
			backToMenu = new FlxButton(200, 20, "Back to Menu", backToMenuSelected);
			
			gunter = new FlxSprite(240, 150, _assetFactory.getSpriteClass("gunter"));
			
			add(info);
			add(backToMenu);
			add(gunter);
		}
		
		override public function update():void
		{
			super.update();
		}
		
		private function backToMenuSelected():void
		{
			FlxG.switchState(new MenuState());
		}
		
	}

}