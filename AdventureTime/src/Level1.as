package  
{
	import org.flixel.*;
	
	public class Level1 extends StageLevel
	{
		
		[Embed(source = "../dame/mapCSV_Level1_Sky.csv", mimeType = "application/octet-stream")] public var skyCSV:Class;
		[Embed(source = "../dame/mapCSV_Level1_Map.csv", mimeType = "application/octet-stream")] public var mapCSV:Class;
		[Embed(source = "../dame/mapCSV_Level1_Memories.csv", mimeType = "application/octet-stream")] public var memoriesCSV:Class;
		
		private var elevator1:Elevator;
		private var elevator2:Elevator;
		private var elevator3:Elevator;
		private var elevator4:Elevator;
		private var elevator5:Elevator;
		
		public function Level1() 
		{
			super();
			
			elevator1 = new Elevator(26, 4, 10, 0);
			elevator2 = new Elevator(82, 7, 0, 7);
			elevator3 = new Elevator(8, 8, 10, 0, 50);
			elevator4 = new Elevator(4, 6, 10, 0, 45);
			elevator5 = new Elevator(2, 11, 10, 0, 35);
			
			sky = new FlxTilemap;
			sky.loadMap(new skyCSV, _assetFactory.getSpriteClass("skyTilesPNG"), 192, 336);
			sky.setTileProperties(1, FlxObject.NONE);
			sky.scrollFactor.x = 0.9;
			
			map = new FlxTilemap;
			map.loadMap(new mapCSV, _assetFactory.getSpriteClass("mapTilesPNG"), 16, 16, 0, 0, 1, 31);
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
			
			memorieMap.loadMap(new memoriesCSV, _assetFactory.getSpriteClass("beemo"), 16, 16);
			
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
