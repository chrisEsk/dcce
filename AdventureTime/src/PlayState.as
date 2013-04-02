package  
{
	import org.flixel.*;
	
	public class PlayState extends FlxState 
	{
		[Embed(source = '../assets/musicGame.mp3')] private var music:Class;
		
		private var level:Level1;
		private var player:Player;
		private var enemy:Enemy;

		private var enemyGroup:FlxGroup;
		private var elevator1:Elevator;
		private var elevator2:Elevator;
		private var elevator3:Elevator;

		
		public function PlayState() 
		{
		}
		
		override public function create():void
		{
			level = new Level1;
			
			FlxG.play(music);
		
			player = new Player(32, 100);
			
			//	Tell flixel how big our game world is
			FlxG.worldBounds = new FlxRect(0, 0, level.width, level.height);
			
			//	Don't let the camera wander off the edges of the map
			FlxG.camera.setBounds(0, 0, level.width, level.height);
			
			//	The camera will follow the player
			FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
			
			elevator1 = new Elevator(8, 8, 10, 0,50);
			elevator2 = new Elevator(5, 5, 10, 0,45);
			elevator3 = new Elevator(2, 11, 10, 0,35);
				
			add(level);	
			add(enemy);
			add(player);
			
			add(elevator1);
			add(elevator2);
			add(elevator3);
	
			createEnemys();

			// Debug
			FlxG.watch(player.acceleration, "x", "ax");
			FlxG.watch(player.velocity, "x", "vx");
			FlxG.watch(player.velocity, "y", "vy");
			

		}
		override public function update():void
		{
			super.update();
			
			FlxG.collide(player, level);
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