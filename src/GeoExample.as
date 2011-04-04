package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import fm.last.*;
	
	public class GeoExample extends Sprite
	{
		private var _geo:Geo = new Geo();
		
		public function GeoExample()
		{
			_geo.getEvents("Wales");
			_geo.addEventListener(Geo.GET_EVENTS, getEventsHandler);
		}
		
		private function getEventsHandler(e:Event):void
		{
			trace(_geo.xml);				
		}
	}
}