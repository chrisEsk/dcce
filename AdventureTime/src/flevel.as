package  
{
	import org.flixel.*;
	
	public class flevel extends FlxGroup
	{
		[Embed(source = "../assets/mapCSV_Level1_Sky.csv", mimeType = "application/octet-stream")] public var skyCSV:Class;
		[Embed(source = "../assets/backG.png")] public var skyTilesPNG:Class;
		
		public var sky:FlxTilemap;
		
		public function flevel() 
		{
			super();
			
			
			sky = new FlxTilemap;
			sky.loadMap(new skyCSV, skyTilesPNG, 192, 336);
			sky.setTileProperties(1, FlxObject.NONE);
			sky.scrollFactor.x = 0.9;
			
		}
		
	}

}