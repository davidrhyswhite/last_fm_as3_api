package 
{
	import flash.display.Sprite;
	import flash.events.*;
	import flash.net.*;
	
	import fm.last.*;

	public class LibraryExample extends Sprite
	{
		private var _library:Library = new Library();
		
		public function LibraryExample()
		{
		//	_library.addAlbum("Squarepusher", "Hello Everything");
		//	_library.addEventListener(Library.ADD_ALBUM, addAlbumHandler);
			
		//	_library.addArtist("Squarepusher");
		//	_library.addEventListener(Library.ADD_ARTIST, addArtistHandler);
			
			_library.addTrack("Aphex Twin", "Mookid2");
			_library.addEventListener(Library.ADD_TRACK, addTrackHandler);
		
		//	_library.getAlbums("polyneme", 20);
		//	_library.addEventListener(Library.GET_ALBUMS, getAlbumsHandler);
			
		//	_library.getArtists("polyneme", 20);
		//	_library.addEventListener(Library.GET_ARTISTS, getArtistsHandler);
			
		//	_library.getTracks("polyneme", 20);
		//	_library.addEventListener(Library.GET_TRACKS, getTracksHandler);

		}
		private function addAlbumHandler(event:Event):void
        {
        	trace("Album added to library");
        }
		private function addArtistHandler(event:Event):void
        {
        	trace("Artist added to library");
        }
		private function addTrackHandler(event:Event):void
        {
        	trace("Track added to library");
        }
        private function getAlbumsHandler(event:Event):void
        {
        	var albums:XMLList = _library.xml.albums.album;
        	
			for each(var album:XML in albums)
        	{
				trace("Album name: " + album.name);
				trace("Artist: " + album.artist.name);
				trace("Artist URL: " + album.artist.url);
				
				for each(var image:XML in album.image)
				{
					trace("Image size: " + image.@size + " and URL: " + image);
				}
				trace("Playcount: " + album.playcount);
				trace("URL: " + album.url + "\n");
        	}
        }
		
        private function getArtistsHandler(event:Event):void
        {
        	var artists:XMLList = _library.xml.artists.artist;
			
        	for each(var artist:XML in artists)
			{
				trace("Artist: " + artist.name);
				trace("Playcount: " + artist.playcount);
				trace("Tagcount: " + artist.tagcount);
				trace("URL: " + artist.url);
				
				for each(var image:XML in artist.image)
				{
					trace("Image size: " + image.@size + " and URL: " + image);
				}
				trace("Streamable: " + artist.streamable + "\n");
			}
        }
		
        private function getTracksHandler(event:Event):void
        {
        	trace(_library.xml);
        	var tracks:XMLList = _library.xml.tracks.track;

        	for each(var track:XML in tracks)
        	{
				trace("Track name: " + track.name);
				trace("Playcount: " + track.playcount);
				trace("Tagcount: " + track.tagcount);
				trace("Track URL: " + track.url);
				trace("Artist name: " + track.artist.name);
				trace("Artist URL: " + track.artist.url);
				
				for each(var image:XML in track.image)
				{
					trace("Image size: " + image.@size + " and URL: " + image);
				}
				trace("\n");
        	}
        }
	}
}