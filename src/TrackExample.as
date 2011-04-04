package
{
	import flash.display.Sprite;
	import flash.events.*;
	import flash.net.*;
	
	import fm.last.*;

	public class TrackExample extends Sprite
	{
		private var _track:Track = new Track();
		
		public function TrackExample()
		{
		//	_track.addTags("Aphex Twin", "Windowlicker", "electronica");
		//	_track.addEventListener(Track.ADD_TAGS, addTagsHandler);
			
			_track.ban("Girls Aloud", "See the Day");
			_track.addEventListener(Track.BAN, banHandler);
		
		//	_track.getInfo("Aphex Twin", "Delphium");
		//	_track.addEventListener(Track.GET_INFO, getInfoHandler);
		
		//	_track.getSimilar("Aphex Twin", "Delphium");
		//	_track.addEventListener(Track.GET_SIMILAR, getSimilarHandler);
		
		//	_track.getTags("Aphex Twin", "Delphium");
		//	_track.addEventListener(Track.GET_TAGS, getTagsHandler);
		
		//	_track.getTopFans("Aphex Twin", "Delphium");
		//	_track.addEventListener(Track.GET_TOP_FANS, getTopFansHandler);
		
		//	_track.getTopTags("Aphex Twin", "Delphium");
		//	_track.addEventListener(Track.GET_TOP_TAGS, getTopTagsHandler);
		
		//	_track.love("Aphex Twin", "Delphium");
		//	_track.addEventListener(Track.LOVE, loveHandler);
			
		//	_track.removeTag("Aphex Twin", "Windowlicker", "electronica");
		//	_track.addEventListener(Track.REMOVE_TAG, removeTagHandler);
			
		//	_track.search("Aphex Twin", "Windowlicker");
		//	_track.addEventListener(Track.SEARCH, searchHandler);
			
		//	_track.share("Aphex Twin", "Windowlicker", "david@flexlab.co.uk");
		//	_track.addEventListener(Track.SHARE, shareHandler);
		}
		private function addTagsHandler(e:Event):void
		{
			trace("Tags added to track");
		}
		private function banHandler(e:Event):void
		{
			trace("Track banned");
		}
		private function getInfoHandler(e:Event):void
		{
			trace(_track.xml);
			var track:XMLList = _track.xml.track;
			var tags:XMLList = _track.xml.track.toptags.tag;
			
			trace("Track id: " + track.id);
			trace("Track name: " + track.name);
			trace("Track mbid: " + track.mbid);
			trace("Track url: " + track.url);
			trace("Track duration: " + track.duration);
			trace("Track streamable: " + track.streamable);
			trace("Track listeners: " + track.listeners);
			trace("Track playcount: " + track.playcount);
			trace("Artist name: " + track.artist.name);
			trace("Artist mbid: " + track.artist.mbid);
			trace("Artist url: " + track.artist.url);
			trace("Album position: " + track.album.@position);
			trace("Album artist: " + track.album.artist);
			trace("Album title: " + track.album.title);
			trace("Album mbid: " + track.album.mbid);
			trace("Album url: " + track.album.url);
			for each(var image:XML in track.album.image)
			{
				trace("Ablum Image size: " + image.@size + " and URL: " + image);
			}
			trace("\n");
			for each(var tag:XML in tags)
			{
				trace("Tag name: " + tag.name);
				trace("Tag url: " + tag.url + "\n");
			}
		}
		private function getSimilarHandler(e:Event):void
		{
			trace(_track.xml);
			var tracks:XMLList = _track.xml.similartracks.track;
			for each(var track:XML in tracks)
			{
				trace("Track name: " + track.name);
				trace("Track mbid: " + track.mbid);
				trace("Track match: " + track.match);
				trace("Track url: " + track.url);
				trace("Track streamable: " + track.streamable);
				trace("Artist name: " + track.artist.name);
				trace("Artist mbid: " + track.artist.mbid);
				trace("Artist url: " + track.artist.url);
				for each(var image:XML in track.album.image)
				{
					trace("Image size: " + image.@size + " and URL: " + image);
				}
				trace("\n");
			}
		}
		private function getTagsHandler(e:Event):void
		{
			trace(_track.xml);
			var tags:XMLList = _track.xml.tags.tag;
			for each(var tag:XML in tags)
			{
				trace("Tag name: " + tag.name);
				trace("Tag url: " + tag.url + "\n");
			}
		}
		private function getTopFansHandler(e:Event):void
		{
			trace(_track.xml);
			var users:XMLList = _track.xml.topfans.user;
			
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
			trace(_track.xml);
			var tags:XMLList = _track.xml.toptags.tag;
			for each(var tag:XML in tags)
			{
				trace("Tag name: " + tag.name);
				trace("Tag count: " + tag.count);
				trace("Tag url: " + tag.url + "\n");
			}
		}
		private function loveHandler(e:Event):void
		{
			trace("Track loved");
		}
		private function removeTagHandler(e:Event):void
		{
			trace("Tag removed");
		}
		private function searchHandler(e:Event):void
		{
			trace(_track.xml);
			var opensearchNs:Namespace = new Namespace("http://a9.com/-/spec/opensearch/1.1/");
			var results:XMLList = _track.xml.results;
			var tracks:XMLList = _track.xml.results.trackmatches.track;
			trace("Search totalResults: " + results.opensearchNs::totalResults);
			trace("Search startIndex: " + results.opensearchNs::startIndex);
			trace("Search itemsPerPage: " + results.opensearchNs::itemsPerPage + "\n");
			
			for each(var track:XML in tracks)
			{
				trace("Track name: " + track.name);
				trace("Track artist: " + track.artist);
				trace("Track url: " + track.url);
				trace("Track streamable: " + track.streamable);
				trace("Track listeners: " + track.listeners);
				for each(var image:XML in track.image)
				{
					trace("Image size: " + image.@size + " and URL: " + image);
				}
				trace("\n");
			}
		}
		private function shareHandler(e:Event):void
		{
			trace("Track shared");
		}
	}
}