package  
{
	import org.flixel.*;

	public class GameOverState extends FlxState
	{

		protected var backToMenu:FlxButton;
		protected var itsOver:FlxSprite;
		protected var itsBeaten:FlxSprite;
		protected var result:int; //0 loss, 1 win
		
		public function GameOverState(presul:int)
		{
			this.result = presul;
		}
		
		override public function create():void
		{
			
			super.create();
			
			FlxG.mouse.show();
			
			if (result == 0)
			{
				itsOver = new FlxSprite(50, 10, _assetFactory.getSpriteClass("itsover"));
				add(itsOver);
			} else {
				itsBeaten = new FlxSprite(20, 10, _assetFactory.getSpriteClass("itsbeaten"));
				add(itsBeaten);
			}
			
			backToMenu = new FlxButton(120, 180, "Back to Menu", backToMenuSelected);
			
			add(backToMenu);
			
		}
		
		override public function update():void
		{
			super.update();
		}
		
		private function backToMenuSelected():void
		{
			FlxG.resetGame();
		}
		
	}

}