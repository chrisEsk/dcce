package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class Player extends FlxSprite
	{
		[Embed(source = '../assets/finn16x25.png')] private var finnPNG:Class; //Finn
		[Embed(source = '../assets/jake15x23.png')] private var jakePNG:Class; //Jake
		
		[Embed(source = '../assets/jump.mp3')] private var jump:Class;
		
		private var playerHealthBar:FlxHealthBar;
		
		public function Player(X:Number, Y:Number, player:String)
		{
			super(X, Y);
			
			var loadFinnOrJake:String;
			loadFinnOrJake = player; // "Finn" or "Jake"
			
			if (loadFinnOrJake == "Finn") {
				
				loadGraphic(finnPNG, true, true, 16, 25, true);
				addAnimation("idle", [0], 0, false);
				addAnimation("walk", [3, 4, 5], 10, true);
				addAnimation("jump", [2], 0, false);
				addAnimation("hurt", [1], 0, false);
				
			} else if (loadFinnOrJake == "Jake") {
				
				loadGraphic(jakePNG, true, true, 15, 23, true);
				addAnimation("idle", [4], 0, false);
				addAnimation("walk", [1, 2, 3], 10, true);
				addAnimation("jump", [0], 0, false);
				addAnimation("hurt", [1], 0, false);
				
			}
			
			playerHealthBar = new FlxHealthBar(this, 14, 3, 1, 3, false);
			playerHealthBar.health = 100;
			playerHealthBar.trackParent(0, -5);
			
			width = 16;
			height = 25;
			
			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
			
			FlxControl.create(this, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, true, false);
			FlxControl.player1.setCursorControl(false, false, true, true);
			FlxControl.player1.setJumpButton("SPACE", FlxControlHandler.KEYMODE_PRESSED, 200, FlxObject.FLOOR, 250, 200);
			FlxControl.player1.setMovementSpeed(400, 0, 100, 200, 400, 0);
			
			FlxControl.player1.setGravity(0, 400);
			
			facing = FlxObject.RIGHT;
			
		}
		
		override public function update():void
		{
			super.update();
			
			if (touching == FlxObject.FLOOR)
			{
				if (velocity.x != 0)
				{
					play("walk");
				}
				else
				{
					play("idle");
				}
			}
			else if (velocity.y < 0)
			{
				play("jump");
				//FlxG.play(jump);
			}
		}
		
	}
}