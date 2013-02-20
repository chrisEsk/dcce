package  
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		private var player:Player;
		private var floor:FlxTileblock;
		private var platform:FlxTileblock;
		
		public function PlayState() 
		{
		}
		
		override public function create():void
		{
			FlxG.bgColor = 0xff144954;
			
			player = new Player(32, 100);
			
			floor = new FlxTileblock(0, 208, 320, 32);
			floor.makeGraphic(320, 32, 0xff689c16);
			
			platform = new FlxTileblock(100, 160, 128, 16);
			platform.makeGraphic(128, 16, 0xff689c16);
			
			add(player);
			add(floor);
			add(platform);
            
			//	These are debugger watches. Bring up the debug console (the ' key by default) and you'll see their values in real-time as you play
			FlxG.watch(player.acceleration, "x", "ax");
			FlxG.watch(player.velocity, "x", "vx");
			FlxG.watch(player.velocity, "y", "vy");
		}
		
		override public function update():void
		{
			super.update();
			
			FlxG.collide(player, floor);
			FlxG.collide(player, platform);
		}
		
	}

}