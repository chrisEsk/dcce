package  
{
	import org.flixel.*;
	
	public class PlayState extends FlxState 
	{
		[Embed(source = '../assets/musicGame.mp3')] private var music:Class;
		
		private var player:Player;
		private var enemy:Enemy;
		private var floor:FlxTileblock;

		private var enemyGroup:FlxGroup;
		private var elevator1:Elevator;
		private var elevator2:Elevator;
		private var elevator3:Elevator;

		
		public function PlayState() 
		{
		}
		
		override public function create():void
		{
			FlxG.play(music);
			
			FlxG.bgColor = 0xff144954;
		
			player = new Player(32, 100);
			
			floor = new FlxTileblock(0, 208, 320, 32);
			floor.makeGraphic(320, 32, 0xff689c16);
			
		
			elevator1 = new Elevator(8, 8, 10, 0,50);
			elevator2 = new Elevator(5, 5, 10, 0,45);
			elevator3 = new Elevator(2, 11, 10, 0,35);
				
				
			add(enemy);
			add(floor);

			add(player);
			
			add(elevator1);
			add(elevator2);
			add(elevator3);
	
			createEnemys();
            

			//	These are debugger watches. Bring up the debug console (the ' key by default) and you'll see their values in real-time as you play
			FlxG.watch(player.acceleration, "x", "ax");
			FlxG.watch(player.velocity, "x", "vx");
			FlxG.watch(player.velocity, "y", "vy");
			

		}
		override public function update():void
		{
			super.update();
			
			FlxG.collide(player, floor);
			FlxG.collide(player, elevator3);
			FlxG.collide(player, elevator2);
			FlxG.collide(player, elevator1);
			FlxG.overlap(enemy , player, killme);	
		}
		
		private function createEnemys():void
		{
			enemyGroup = new FlxGroup();
			for (var i:Number = 0; i < 10; i++ )
			{
			    enemy = new Enemy (Math.random() * FlxG.width - 700 , Math.random() - 700 );
				enemyGroup.add(enemy);
			}
			add(enemyGroup);
		}
		
		private function killme (e:FlxSprite,p:Player):void
		{
			//trace("hit");
			p.kill();
			p.x = Math.random() * FlxG.width - 700;
			p.y =  Math.random() - 700;
			
			
			
		}
	}

}