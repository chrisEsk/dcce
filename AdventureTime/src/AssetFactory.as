package  
{

	public class AssetFactory
	{
		public function getFinnSprite():Class
		{
			[Embed(source = '../assets/finn16x25.png')]
			var finnPNG:Class;
			return finnPNG;
		}
		
	}

}