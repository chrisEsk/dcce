package  
{
	import org.flixel.*;
	public class Level1 extends FlxGroup
	{
		[Embed(source = "../assets/mapCSV_Level1_Sky.csv", mimeType = "application/octet-stream")] public var skyCSV:Class;
		[Embed(source = "../assets/mapCSV_Level1_Map.csv", mimeType = "application/octet-stream")] public var mapCSV:Class;
		
		[Embed(source = "../assets/backdrop.png")] public var skyTilesPNG:Class;
		[Embed(source = "../assets/tiles.png")] public var mapTilesPNG:Class;
		
		public var sky:FlxTilemap;
		public var map:FlxTilemap;
		
		private var elevator1:Elevator;
		private var elevator2:Elevator;
		
		public var width:int;
		public var height:int;
		
		public function Level1() 
		{
			super();
			
			sky = new FlxTilemap;
			sky.loadMap(new skyCSV, skyTilesPNG, 192, 336);
			sky.setTileProperties(1, FlxObject.NONE);
			sky.scrollFactor.x = 0.9;
			
			map = new FlxTilemap;
			map.loadMap(new mapCSV, mapTilesPNG, 16, 16, 0, 0, 1, 31);
			
			//	Makes these tiles as allowed to be jumped UP through (but collide at all other angles)
			map.setTileProperties(40, FlxObject.UP, null, null, 4);
			
			width = map.width;
			height = map.height;
			
			elevator1 = new Elevator(26, 6, 10, 0);
			elevator2 = new Elevator(82, 6, 0, 7);
			
			add(sky);
			add(map);
			add(elevator1);
			add(elevator2);
		
		}
		
		
		
	}

}