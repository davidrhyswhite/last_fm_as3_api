package
{
	import flash.display.Sprite;
	import flash.events.*;
	import flash.net.*;
	
	import fm.last.*;

	public class PlaylistExample extends Sprite
	{
		private var _playlist:Playlist = new Playlist();
		
		public function PlaylistExample()
		{
		//	_playlist.fetch("lastfm://playlist/album/2026127");
		//	_playlist.addEventListener(Playlist.FETCH, fetchHandler);
			
		//	_playlist.addTrack(2081980, "Autechre", "Reniform puls");
		//	_playlist.addEventListener(Playlist.ADD_TRACK, addTrackHandler);
			
			_playlist.create("IDM", "");
			_playlist.addEventListener(Playlist.CREATE, createHandler);
		}
		private function addTrackHandler(event:Event):void
		{
			trace("Track added to playlist");
		}
		private function createHandler(event:Event):void
		{
			trace("Playlist created");
		}
		private function fetchHandler(event:Event):void
		{
			var xmlNS:Namespace = new Namespace("http://xspf.org/ns/0/");
			trace(_playlist.xml.xmlNS::playlist);
			trace("Playlist title: " + _playlist.xml.xmlNS::playlist.xmlNS::title);
			trace("Playlist annotation: " + _playlist.xml.xmlNS::playlist.xmlNS::annotation);
			trace("Playlist creator: " + _playlist.xml.xmlNS::playlist.xmlNS::creator);
			trace("Playlist date: " + _playlist.xml.xmlNS::playlist.xmlNS::date + "\n");
			var tracks:XMLList = _playlist.xml.xmlNS::playlist.xmlNS::trackList.xmlNS::track;
			
			for each(var track:XML in tracks)
			{
				trace("Track title: " + track.xmlNS::title);
				trace("Track identifier: " + track.xmlNS::identifier);
				trace("Track album: " + track.xmlNS::album);
				trace("Track creator: " + track.xmlNS::creator);
				trace("Track duration: " + track.xmlNS::duration);
				trace("Track info: " + track.xmlNS::info);
				trace("Track image: " + track.xmlNS::image + "\n");
			}
		}
	}
}