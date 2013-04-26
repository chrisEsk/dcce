package  
{
	import org.flixel.*;
	
	public class AssetFactory
	{
		protected var requestedSprite:Class;
		
		public function getSpriteClass(psprite:String):Class
		{
			
			if (psprite == "gunter")
			{
				[Embed(source = "../assets/gunter.png")]var gunterImg:Class;
				requestedSprite = gunterImg;
			}
			
			if (psprite == "menuBG")
			{
				[Embed(source = "../assets/menu.png")] var menuImg:Class;
				requestedSprite = menuImg;
			}
			
			if (psprite == "beemo")
			{
				[Embed(source = "../assets/memories16x16.png")] var memoriePNG:Class;
				requestedSprite = memoriePNG;
			}
			
			if (psprite == "playstatemusic")
			{
				[Embed(source = '../assets/musicGame.mp3')] var music:Class;
				requestedSprite = music;
			}
			
			if (psprite == "skyTilesPNG")
			{
				[Embed(source = "../assets/backdrop.png")] var skyTilesPNG:Class;
				requestedSprite = skyTilesPNG;
			}
			
			if (psprite == "mapTilesPNG")
			{
				[Embed(source = "../assets/tiles.png")] var mapTilesPNG:Class;
				requestedSprite = mapTilesPNG;
			}
			
			if (psprite == "elevatorPNG")
			{
				[Embed(source = '../assets/elevator.png')] var elevatorPNG:Class;
				requestedSprite = elevatorPNG;
			}
			
			if (psprite == "enemysword")
			{
				[Embed(source = '../assets/sword.png')] var enemy:Class;
				requestedSprite = enemy;
			}
			
			if (psprite == "finnPNG")
			{
				[Embed(source = '../assets/finn16x25.png')] var finnPNG:Class;
				requestedSprite = finnPNG;
			}
			
			if (psprite == "jakePNG")
			{
				[Embed(source = '../assets/jake15x23.png')] var jakePNG:Class;
				requestedSprite = jakePNG;
			}
			
			if (psprite == "itsover")
			{
				[Embed(source = '../assets/itstheend.png')] var itsover:Class;
				requestedSprite = itsover;
			}
			
			if (psprite == "itsbeaten")
			{
				[Embed(source = '../assets/itsbeaten.png')] var itsbeaten:Class;
				requestedSprite = itsbeaten;
			}
			
			return requestedSprite;
		}
		
	}

}