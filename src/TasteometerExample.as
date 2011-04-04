package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import fm.last.*;
	
	public class TasteometerExample extends Sprite
	{
		private var _tasteometer:Tasteometer = new Tasteometer();
		
		public function TasteometerExample()
		{
			_tasteometer.compare("user", "user", "polyneme", "mmockett");
			_tasteometer.addEventListener(Tasteometer.COMPARE, compareHandler);
		}
		
		private function compareHandler(e:Event):void
		{
			trace(_tasteometer.xml);
			var artists:XMLList = _tasteometer.xml.comparison.result.artists.artist;
			var users:XMLList = _tasteometer.xml.comparison.input.user;
			trace("Comparison score: " + _tasteometer.xml.comparison.result.score);
			trace("Comparison artist matches: " + _tasteometer.xml.comparison.result.artists.@matches);
			trace("\n");
			for each(var artist:XML in artists)
			{
				trace("Artist name: " + artist.name);
				trace("Artist url: " + artist.url);
				for each(var image:XML in artist.image)
				{
					trace("Image size: " + image.@size + " and URL: " + image);
				}
			}
			trace("\n");
			for each(var user:XML in users)
			{
				trace("Artist name: " + user.name);
				trace("Artist url: " + user.url);
				for each(image in user.image)
				{
					trace("Image size: " + image.@size + " and URL: " + image);
				}
			}
		}
	}
}