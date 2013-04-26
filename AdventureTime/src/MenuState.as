package
{
	import org.flixel.*;
	
	public class MenuState extends FlxState
	{		
		protected var finn:FlxButton;
		protected var jake:FlxButton;
		protected var menu:Menu;
		protected var selectedCharacter:String;

		override public function create():void
		{
			super.create();
			
			FlxG.mouse.show();
			
			menu = new Menu(0, 0);
			
			jake = new FlxButton(66, 140, "Jake", jakeSelected);
			finn = new FlxButton(235, 140, "Finn", finnSelected);
			
			add(menu);
			add(jake);
			add(finn);
			//FlxG.play(introMusic);
		}
		
		override public function update():void
		{
			super.update();
		}
		
		private function jakeSelected():void
		{
			this.selectedCharacter = "Jake";
			FlxG.switchState(new PlayState(selectedCharacter));
		}
		
		private function finnSelected():void
		{
			this.selectedCharacter = "Finn";
			FlxG.switchState(new PlayState(selectedCharacter));
		}
		
	}
}
