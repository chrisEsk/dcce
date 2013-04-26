package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class PlayState extends FlxState 
	{
		
		public var level:Level1;
		private var player:Playable;
		private var enemy:FallingSword;
		private var enemyGroup:FlxGroup;
	    private var musicState:int = 0;
		private var maxLife:int = 5;
		
		private var score:FlxText;
		private var life:FlxText;
		
		private var selectedCharacter:String;
		private var pfactroy:PlayerFactory = new PlayerFactory();
		
		public function PlayState(clickedPlayer:String) 
		{
			selectedCharacter = clickedPlayer;
		}
		
		override public function create():void 
		{
			level = new Level1;
			
			player = pfactroy.getPlayer(selectedCharacter);
			
			score = new FlxText(0, 0, 100);
			score.color = 0xffffffff;
			score.shadow = 0xff000000;
			score.scrollFactor.x = 0;
			score.scrollFactor.y = 0;
			score.text = "Beemos: " + "0 / " + level.totalMemoriesInMap.toString();
			
			life = new FlxText(285, 0, 100);
			life.color = 0xffffffff;
			life.shadow = 0xff000000;
			life.scrollFactor.x = 0;
			life.scrollFactor.y = 0;
			life.text = "Life: " + maxLife;
			
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
			add(life);
			
			createEnemys();	
			playMusic();
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(player, level);
			swordDead();
			fallDead();
			FlxG.overlap(player, level.memories, hitMemorie);
			checkObjective();
		}
		
		public function playMusic():void
		{
			if (musicState == 0) {
				FlxG.play(_assetFactory.getSpriteClass("playstatemusic"), 1.0, true, true);
			}
			musicState = 1;
		}
		
		
		private function createEnemys():void
		{
			try
			{
				enemyGroup = new FlxGroup();
			for (var i:Number = 0; i < 90; i++ )
			{
			    enemy = new FallingSword (Math.random() * level.width - 500 , Math.random()* level.height - 500 );
				enemyGroup.add(enemy);
			}
			add(enemyGroup);
			} catch(e:*) {
				trace(e);
			}
			
		}
		
		private function fallDead():void
		{
			if (player.getScreenXY().y > 255)
			{
				hitMe();
			}
		}
		
		private function checkObjective():void
		{
			if (FlxG.score.toString() == level.totalMemoriesInMap.toString())
			{
				FlxG.switchState(new GameOverState(1));
			}
			
		}
		
		private function swordDead():void
		{
			try {
				FlxG.overlap(enemyGroup, player, hitMe);
			}catch(e:*) {
				hitMe();	
			}
		}	
		
		private function hitMe():void
		{
			player.kill();
			player.reset(32, 100);	
			enemyGroup.kill();
			createEnemys();
			if (maxLife <= 1) {
				FlxG.switchState(new GameOverState(0));
				
				} else {
					maxLife = maxLife - 1; life.text =  "Life: " + maxLife;
				}
		}
		
		private function hitMemorie(p:FlxObject, memorie:FlxObject):void
		{
			memorie.kill();
			
			FlxG.score += 1;
			
			score.text = "Beemos: " + FlxG.score.toString() + " / " + level.totalMemoriesInMap.toString();
		}
		
	}
}
