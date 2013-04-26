package  
{
	import org.flixel.*;
	public class Level1 extends FlxGroup
	{
		[Embed(source = '../assets/musicGame.mp3')] private var music:Class;
		
		[Embed(source = "../dame/mapCSV_Level1_Sky.csv", mimeType = "application/octet-stream")] public var skyCSV:Class;
		[Embed(source = "../dame/mapCSV_Level1_Map.csv", mimeType = "application/octet-stream")] public var mapCSV:Class;
		[Embed(source = "../dame/mapCSV_Level1_Memories.csv", mimeType = "application/octet-stream")] public var memoriesCSV:Class;
		
		[Embed(source = "../assets/backdrop.png")] public var skyTilesPNG:Class;
		[Embed(source = "../assets/tiles.png")] public var mapTilesPNG:Class;
		[Embed(source = "../assets/memories16x16.png")] public var memoriePNG:Class;
		
		public var sky:FlxTilemap;
		public var map:FlxTilemap;
		public var memories:FlxGroup;
		
		private var elevator1:Elevator;
		private var elevator2:Elevator;
		private var elevator3:Elevator;
		private var elevator4:Elevator;
		private var elevator5:Elevator;
		
		public var width:int;
		public var height:int;
		public var totalMemoriesInMap:int;
		
		public function Level1() 
		{
			super();
			
			elevator1 = new Elevator(26, 6, 10, 0);
			elevator2 = new Elevator(82, 7, 0, 7);
			elevator3 = new Elevator(8, 8, 10, 0, 50);
			elevator4 = new Elevator(4, 6, 10, 0, 45);
			elevator5 = new Elevator(2, 11, 10, 0, 35);
			
			sky = new FlxTilemap;
			sky.loadMap(new skyCSV, skyTilesPNG, 192, 336);
			sky.setTileProperties(1, FlxObject.NONE);
			sky.scrollFactor.x = 0.9;
			
			map = new FlxTilemap;
			map.loadMap(new mapCSV, mapTilesPNG, 16, 16, 0, 0, 1, 31);
			map.setTileProperties(40, FlxObject.UP, null, null, 4);
			
			width = map.width;
			height = map.height;
			
			add(sky);
			add(map);
			add(elevator1);
			add(elevator2);
			add(elevator3);
			add(elevator4);
			add(elevator5);
			
			parseMemories();
		}
		
		private function parseMemories():void
		{
			var memorieMap:FlxTilemap = new FlxTilemap();
			
			memorieMap.loadMap(new memoriesCSV, memoriePNG, 16, 16);
			
			memories = new FlxGroup();
			
			for (var ty:int = 0; ty < memorieMap.heightInTiles; ty++)
			{
				for (var tx:int = 0; tx < memorieMap.widthInTiles; tx++)
				{
					if (memorieMap.getTile(tx, ty) == 1)
					{
						memories.add(new Memorie(tx, ty));
						totalMemoriesInMap++;
					}
				}
			}
		}
		
		
	}
}
