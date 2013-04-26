package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class PlayState extends FlxState 
	{
		[Embed(source = '../assets/musicGame.mp3')] private var music:Class;
		
		public var level:Level1;
		private var player:Player;
		private var enemy:Enemy;
		private var enemyGroup:FlxGroup;
	
		
		private var score:FlxText;
		
		
		private var selectedCharacter:String;
		
		public function PlayState(clickedPlayer:String) 
		{
			selectedCharacter = clickedPlayer;
		
		}
		
		override public function create():void 
		{
			level = new Level1;
			player = new Player(32, 100, selectedCharacter);
			
			
			score = new FlxText(0, 0, 100);
			score.color = 0xffffffff;
			score.shadow = 0xff000000;
			score.scrollFactor.x = 0;
			score.scrollFactor.y = 0;
			score.text = "0 / " + level.totalMemoriesInMap.toString();
			
			FlxG.play(music, 1.0, true);
			FlxG.worldBounds = new FlxRect(0, 0, level.width, level.height);
			FlxG.camera.setBounds(0, 0, level.width, level.height);
			FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
			FlxG.watch(player.acceleration, "x", "ax");
			FlxG.watch(player.velocity, "x", "vx");
			FlxG.watch(player.velocity, "y", "vy");
			
			add(level);	
			add(player);
			add(enemy);
			add(level.memories);
			add(score);
			
			createEnemys();	
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(player, level);
			swordDead();
			fallDead();
			
			FlxG.overlap(player, level.memories, hitMemorie);
		
		}
		
		private function createEnemys():void
		{
			try
			{
				enemyGroup = new FlxGroup();
			for (var i:Number = 0; i < 90; i++ )
			{
			    enemy = new Enemy (Math.random() * level.width - 500 , Math.random()* level.height - 500 );
				enemyGroup.add(enemy);
			}
			add(enemyGroup);
			}catch(e:*) {
				trace(e);
			}
			
		}
		
		private function fallDead():void
		{
			if (player.getScreenXY().y > 255)
			{
				killme();
			}
		}
		
		private function swordDead():void
		{
			try {
				FlxG.overlap(enemyGroup, player, killme);
			}catch(e:*) {
				killme();
				
			}
		}
		
		
		
		private function killme():void
		{
			player.kill();
			player.reset(32, 100);
			enemyGroup.kill();
			createEnemys();
		}
		
		private function hitMemorie(p:FlxObject, memorie:FlxObject):void
		{
			memorie.kill();
			
			FlxG.score += 1;
			
			score.text = FlxG.score.toString() + " / " + level.totalMemoriesInMap.toString();
		}
		
	}
}
