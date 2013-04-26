package  
{
	import org.flixel.FlxSprite;

	public class Memorie extends FlxSprite
	{
		[Embed(source = "../assets/memories16x16.png")] public var memoriePNG:Class;
		
		public function Memorie(X:int, Y:int)
		{
			super(X * 16, Y * 16, memoriePNG);
			
			solid = true;
		}
		
	}

}