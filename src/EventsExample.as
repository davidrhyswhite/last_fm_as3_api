package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import fm.last.*;
	
	public class EventsExample extends Sprite
	{
		private var _event:Events = new Events();
		
		public function EventsExample()
		{
		//	_event.attend(328799, 1);
		//	_event.addEventListener(Events.ATTEND, attendHandler);
			
			_event.getInfo(328799);
			_event.addEventListener(Events.GET_INFO, getInfoHandler);
		}
		
		private function attendHandler(e:Event):void
		{
			trace("Attending event status sent (check your last.fm account)");
		}
		
		private function getInfoHandler(e:Event):void
		{
			trace(_event.xml);
			
			var geoNs:Namespace = new Namespace("http://www.w3.org/2003/01/geo/wgs84_pos#");
			var event:XMLList = _event.xml.event;
			
			trace("Event id: " + event.id);
			trace("Event title: " + event.title);
			for each(var artist:XML in event.artists.artist)
			{
				trace("Artist: " + artist);
			}
			trace("Headliner: " + event.artists.headliner);
			trace("Venue name: " + event.venue.name);
			trace("Venue city: " + event.venue.location.city);
			trace("Venue country: " + event.venue.location.country);
			trace("Venue street: " + event.venue.location.street);
			trace("Venue postalcode: " + event.venue.location.postalcode);
			trace("Venue latitude: " + event.venue.location.geoNs::point.geoNs::lat);
			trace("Venue longditude: " + event.venue.location.geoNs::point.geoNs::long);
			trace("Venue city: " + event.venue.location.city);
			trace("Venue url: " + event.venue.url);
			
			trace("Event start date: " + event.startDate);
			trace("Event description: " + event.description);
			for each(var image:XML in event.image)
			{
				trace("Image size: " + image.@size + " and URL: " + image);
			}
			trace("Event attendance: " + event.attendance);
			trace("Event reviews: " + event.reviews);
			trace("Event tag: " + event.tag);
			trace("Event url: " + event.url + "\n");
				
		}
	}
}