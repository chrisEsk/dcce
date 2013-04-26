package
{
	/*
	 *  _                            ___         
	   |_| _|    _ __ _|_    __ _     |  o __  _ 
	   | |(_|\_/(/_| | |_|_| | (/_    |  | |||(/_
	 * 
	 * Por Christian Esquivel (@ChrisEsk) y Daniel Castro
	 * Abril 2013, Universidad Cenfotec
	 */

	import org.flixel.*;
	
	[SWF(width="640", height="480", backgroundColor="#000000")]

	public class Main extends FlxGame
	{
		public function Main()
		{
			super(320, 240, MenuState, 2, 60, 60); //2x zoom
			
			forceDebugger = true;
		}
	}
}
