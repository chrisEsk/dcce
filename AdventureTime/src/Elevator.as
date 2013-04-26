package  
{
import org.flixel.*;
	
	public class Elevator extends FlxSprite
	{
		[Embed(source = '../assets/elevator.png')] private var elevatorPNG:Class;
		
		public var moveX:Boolean = false;
		public var moveY:Boolean = false;
		private var startPoint:FlxPoint;
		private var endPoint:FlxPoint;
		
		public function Elevator(X:Number, Y:Number, Width:Number, Height:Number, Speed:int = 40)
		{
			super(X * 16, Y * 16, elevatorPNG);
			
			startPoint = new FlxPoint(X * 16, Y * 16);
			endPoint = new FlxPoint((X + Width) * 16, (Y + Height) * 16);
			
			if (Width > 0)
			{
				moveX = true;
				velocity.x = Speed;
			}
			
			if (Height > 0)
			{
				moveY = true;
				velocity.y = Speed;
			}
			immovable = true;
			moves = true;
			allowCollisions = FlxObject.UP;
		}
		
		override public function update():void
		{
			if (moveX)
			{
				if (x > endPoint.x)
				{
					x = endPoint.x;
					velocity.x = -velocity.x;
				}
				else if (x < startPoint.x)
				{
					x = startPoint.x;
					velocity.x = -velocity.x;
				}
			}
			
			if (moveY)
			{
				if (y > endPoint.y)
				{
					y = endPoint.y;
					velocity.y = -velocity.y;
				}
				else if (y < startPoint.y)
				{
					y = startPoint.y;
					velocity.y = -velocity.y;
				}
				
			}
		}
		
	}

}
