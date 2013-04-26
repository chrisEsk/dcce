package  
{
	import org.flixel.*;

	public class Memorie extends Collectible
	{
		[Embed(source = "../assets/memories16x16.png")] protected var memoriePNG:Class;
		
		public function Memorie(X:int, Y:int)
		{
			super(X, Y, this.memoriePNG);
			
		}
		
	}

}