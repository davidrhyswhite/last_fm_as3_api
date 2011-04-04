package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import fm.last.*;

	public class AlbumExample extends Sprite
	{
		private var _album:Album = new Album();
		
		public function AlbumExample()
		{
		//	_album.getInfo("Autechre", "Amber");
		//	_album.addEventListener(Album.GET_INFO, getInfoHandler);
			
		//	_album.getTags("Autechre", "Confield");
		//	_album.addEventListener(Album.GET_TAGS, getTagsHandler);
			
		//	_album.addTags("Autechre", "Confield", "glitch");
		//	_album.addEventListener(Album.ADD_TAGS, addTagsHandler);
		
		//	_album.removeTag("Autechre", "Confield", "idm");
		//	_album.addEventListener(Album.REMOVE_TAG, removeTagHandler);
		
		//	_album.search("Amber");
		//	_album.addEventListener(Album.SEARCH, searchHandler);
		
		}
		private function getInfoHandler(event:Event):void
		{
			trace(_album.xml);
			var album:XMLList = _album.xml.album;
			trace("Album name: " + album.name);
			trace("Album artist: " + album.artist);
			trace("Album id: " + album.id);
			trace("Album mbid: " + album.mbid);
			trace("Album url: " + album.url);
			trace("Album release date: " + album.releasedate);
			for each(var image:XML in album.image)
			{
				trace("Image size: " + image.@size + " and URL: " + image);
			}
			trace("Album listeners: " + album.listeners);
			trace("Album playcount: " + album.playcount);
			trace("Album toptags: " + album.toptags);
		}
		
		private function getTagsHandler(event:Event):void
		{
			trace(_album.xml);
		}
		
		private function addTagsHandler(event:Event):void
		{
			trace("tags added");
		}
		
		private function removeTagHandler(event:Event):void
		{
			trace("tag removed");
		}
		
		private function searchHandler(event:Event):void
		{
			trace(_album.xml.results.albummatches);
			var albums:XMLList = _album.xml.results.albummatches.album;
			
			for each (var album:XML in albums)
			{
				trace("Album name: " + album.name);
				trace("Album artist: " + album.artist);
				trace("Album id: " + album.id);
				trace("Album url: " + album.url);
				for each(var image:XML in album.image)
				{
					trace("Image size: " + image.@size + " and URL: " + image);
				}
				trace("Album streamable: " + album.streamable + "\n");
			}
		}
	}
}