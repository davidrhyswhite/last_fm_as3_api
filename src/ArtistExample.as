package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import fm.last.*;
	
	public class ArtistExample extends Sprite
	{
		private var _artist:Artist = new Artist();
		
		public function ArtistExample()
		{
_artist.addTags("Squarepusher", "Electronica");
_artist.addEventListener(Artist.ADD_TAGS, addTagsHandler);

_artist.getEvents("Squarepusher");
_artist.addEventListener(Artist.GET_EVENTS, getEventsHandler);

_artist.getInfo("Squarepusher");
_artist.addEventListener(Artist.GET_INFO, getInfoHandler);

_artist.getSimilar("Squarepusher");
_artist.addEventListener(Artist.GET_SIMILAR, getSimilarHandler);

_artist.getTags("Squarepusher");
_artist.addEventListener(Artist.GET_TAGS, getTagsHandler);

_artist.getTopAlbums("Squarepusher");
_artist.addEventListener(Artist.GET_TOP_ALBUMS, getTopAlbumsHandler);

_artist.getTopFans("Squarepusher");
_artist.addEventListener(Artist.GET_TOP_FANS, getTopFansHandler);

_artist.getTopTags("Squarepusher");
_artist.addEventListener(Artist.GET_TOP_TAGS, getTopTagsHandler);

_artist.getTopTracks("Squarepusher");
_artist.addEventListener(Artist.GET_TOP_TRACKS, getTopTracksHandler);

_artist.removeTag("Squarepusher", "electronica");
_artist.addEventListener(Artist.REMOVE_TAG, removeTagHandler);

_artist.search("Squarepusher");
_artist.addEventListener(Artist.SEARCH, searchHandler);
		}
		
		private function addTagsHandler(e:Event):void
		{
			trace("Tags added");
		}
		
		private function getEventsHandler(e:Event):void
		{
			trace(_artist.xml);
			
			var geoNs:Namespace = new Namespace("http://www.w3.org/2003/01/geo/wgs84_pos#");
			var events:XMLList = _artist.xml.events.event;
			
			for each (var event:XML in events)
			{
				trace("Event status: " + event.@status);
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
				trace("Event end date: " + event.endDate);
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
		
		private function getInfoHandler(e:Event):void
		{
			trace(_artist.xml);
			var artist:* = _artist.xml.artist;
			trace("Artist name: " + artist.name);
			trace("Artist mbid: " + artist.mbid);
			trace("Artist url: " + artist.url);
			for each(var image:XML in artist.image)
			{
				trace("Image size: " + image.@size + " and URL: " + image);
			}
			trace("Artist streamable: " + artist.streamable);
			trace("Artist listeners: " + artist.stats.listeners);
			trace("Artist playcount: " + artist.stats.playcount);
			trace("Artist biography published: " + artist.bio.published);
			trace("Artist biography summary: " + artist.bio.summary);
			trace("Artist biography content: " + artist.bio.content);
			trace("\n Similar artists \n");
			var similarArtists:XMLList = _artist.xml.artist.similar.artist;
			for each(artist in similarArtists)
			{
				trace("Similar artist name: " + artist.name);
				trace("Similar artist url: " + artist.url);
				for each(image in artist.image)
				{
					trace("Image size: " + image.@size + " and URL: " + image);
				}
				trace("\n");
			}
		}
		
		private function getSimilarHandler(e:Event):void
		{
			trace(_artist.xml);
			var artists:XMLList = _artist.xml.similarartists.artist;
			for each(var artist:XML in artists)
			{
				trace("Similar artist name: " + artist.name);
				trace("Similar artist mbid: " + artist.mbid);
				trace("Similar artist match: " + artist.match);
				trace("Similar artist url: " + artist.url);
				for each(var image:XML in artist.image)
				{
					trace("Image size: " + image.@size + " and URL: " + image);
				}
				trace("Similar artist streamable: " + artist.streamable + "\n");
			}
		}
		
		private function getTagsHandler(e:Event):void
		{
			trace(_artist.xml);
			var tags:XMLList = _artist.xml.tags.tag;
			for each(var tag:XML in tags)
			{
				trace("Tag name: " + tag.name);
				trace("Tag url: " + tag.url + "\n");
			}
		}
		
		private function getTopAlbumsHandler(e:Event):void
		{
			trace(_artist.xml);
			var albums:XMLList =  _artist.xml.topalbums.album;
			
			for each(var album:XML in albums)
			{
				trace("Album rank: " + album.@rank);
				trace("Album name: " + album.name);
				trace("Album playcount: " + album.playcount);
				trace("Album mbid: " + album.mbid);
				trace("Album url: " + album.url);
				trace("Artist name: " + album.artist.name);
				trace("Artist mbid: " + album.artist.mbid);
				trace("Artist url: " + album.artist.url);
				for each(var image:XML in album.image)
				{
					trace("Image size: " + image.@size + " and URL: " + image);
				}
				trace("\n");
			}
		}
		
		private function getTopFansHandler(e:Event):void
		{
			trace(_artist.xml);
			var users:XMLList = _artist.xml.topfans.user;
			for each(var user:XML in users)
			{
				trace("User name: " + user.name);
				trace("User url: " + user.url);
				for each(var image:XML in user.image)
				{
					trace("Image size: " + image.@size + " and URL: " + image);
				}
				trace("User weight: " + user.weight + "\n");
			}
		}
		
		private function getTopTagsHandler(e:Event):void
		{
			trace(_artist.xml);
			var tags:XMLList = _artist.xml.toptags.tag;
			for each(var tag:XML in tags)
			{
				trace("Tag name: " + tag.name);
				trace("Tag count: " + tag.count);
				trace("Tag url: " + tag.url + "\n");
			}
		}
		
		private function getTopTracksHandler(e:Event):void
		{
			trace(_artist.xml);
			var tracks:XMLList = _artist.xml.toptracks.track;
			
			for each(var track:XML in tracks)
			{
				trace("Artist name: " + track.artist.name);
				trace("Artist mbid: " + track.artist.mbid);
				trace("Artist url: " + track.artist.url);
				trace("Track name: " + track.name);
				trace("Track mbid: " + track.mbid);
				trace("Track url: " + track.url);
				trace("Track streamable: " + track.streamable);

				for each(var image:XML in track.image)
				{
					trace("Image size: " + image.@size + " and URL: " + image);
				}
				trace("\n");
			}
		}
		
		private function removeTagHandler(e:Event):void
		{
			trace("Tag removed");
		}
		
		private function searchHandler(e:Event):void
		{
			trace(_artist.xml);	
			var opensearchNs:Namespace = new Namespace("http://a9.com/-/spec/opensearch/1.1/");
			var artists:XMLList = _artist.xml.results.artistmatches.artist;
			var results:XMLList = _artist.xml.results;
			trace("Search totalResults: " + results.opensearchNs::totalResults);
			trace("Search startIndex: " + results.opensearchNs::startIndex);
			trace("Search itemsPerPage: " + results.opensearchNs::itemsPerPage + "\n");
			
			for each (var artist:XML in artists)
			{
				trace("Artist name: " + artist.name);
				trace("Artist mbid: " + artist.mbid);
				trace("Artist url: " + artist.url);
				trace("Artist name: " + artist.name);
				trace("Artist image_small: " + artist.image_small);
				trace("Artist streamable: " + artist.streamable + "\n");
				
			}
		}
	}
}