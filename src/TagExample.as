package
{
	import flash.display.Sprite;
	import flash.events.*;
	import flash.net.*;
	
	import fm.last.*;

	public class TagExample extends Sprite
	{
		private var _tag:Tag = new Tag();
		
		public function TagExample()
		{
		//	_tag.getSimilar("idm");
		//	_tag.addEventListener(Tag.GET_SIMILAR, getSimilarHandler);
			
		//	_tag.getTopAlbums("idm");
		//	_tag.addEventListener(Tag.GET_TOP_ALBUMS, getTopAlbumsHandler);
			
		//	_tag.getTopArtists("idm");
		//	_tag.addEventListener(Tag.GET_TOP_ARTISTS, getTopArtistsHandler);
			
		//	_tag.getTopTags();
		//	_tag.addEventListener(Tag.GET_TOP_TAGS, getTopTagsHandler);
			
		//	_tag.getTopTracks("idm");
		//	_tag.addEventListener(Tag.GET_TOP_TRACKS, getTopTracksHandler);
			
		//	_tag.getWeeklyArtistChart("idm");
		//	_tag.addEventListener(Tag.GET_WEEKLY_ARTIST_CHART, getWeeklyArtistChartHandler);
			
		//	_tag.getWeeklyChartList("idm");
		//	_tag.addEventListener(Tag.GET_WEEKLY_CHART_LIST, getWeeklyChartListHandler);
			
			_tag.search("idm");
			_tag.addEventListener(Tag.SEARCH, searchHandler);
			
		}
		private function getSimilarHandler(event:Event):void
		{
			trace(_tag.xml);
			var tags:XMLList = _tag.xml.similartags.tag;
			for each(var tag:XML in tags)
			{
				trace("Tag name: " + tag.name);
				trace("Tag url: " + tag.url);
				trace("Tag streamable: " + tag.streamable + "\n");
			}
		}
		private function getTopAlbumsHandler(event:Event):void
		{
			trace(_tag.xml);
			var albums:XMLList =  _tag.xml.topalbums.album;
			
			for each(var album:XML in albums)
			{
				trace("Album rank: " + album.@rank);
				trace("Album name: " + album.name);
				trace("Album tagcount: " + album.tagcount);
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
		private function getTopArtistsHandler(event:Event):void
		{
			trace(_tag.xml);
			var artists:XMLList = _tag.xml.topartists.artist;
			for each(var artist:XML in artists)
			{
				trace("Artist rank: " + artist.@rank);
				trace("Artist name: " + artist.name);
				trace("Artist tagcount: " + artist.tagcount);
				trace("Artist mbid: " + artist.mbid);
				trace("Artist url: " + artist.url);
				trace("Artist streamable: " + artist.streamable);
				for each(var image:XML in artist.image)
				{
					trace("Image size: " + image.@size + " and URL: " + image);
				}
				trace("\n");
			}
		}
		private function getTopTagsHandler(event:Event):void
		{
			trace(_tag.xml);
			var tags:XMLList = _tag.xml.toptags.tag;
			for each(var tag:XML in tags)
			{
				trace("Tag name: " + tag.name);
				trace("Tag url: " + tag.url);
				trace("Tag count: " + tag.count + "\n");
			}
		}
		private function getTopTracksHandler(event:Event):void
		{
			trace(_tag.xml);
			var tracks:XMLList = _tag.xml.toptracks.track;
			
			for each(var track:XML in tracks)
			{
				trace("Track rank: " + track.@rank);
				trace("Track name: " + track.name);
				trace("Track tagcount: " + track.tagcount);
				trace("Track mbid: " + track.mbid);
				trace("Track url: " + track.url);
				trace("Track streamable: " + track.streamable);
				trace("Artist name: " + track.artist.name);
				trace("Artist mbid: " + track.artist.mbid);
				trace("Artist url: " + track.artist.url);
				for each(var image:XML in track.image)
				{
					trace("Image size: " + image.@size + " and URL: " + image);
				}
				trace("\n");
			}
		}
		private function getWeeklyArtistChartHandler(event:Event):void
		{
			trace(_tag.xml);
			var artists:XMLList = _tag.xml.weeklyartistchart.artist;
			for each(var artist:XML in artists)
			{
				trace("Artist rank: " + artist.@rank);
				trace("Artist name: " + artist.name);
				trace("Artist mbid: " + artist.mbid);
				trace("Artist weight: " + artist.weight);
				trace("Artist url: " + artist.url + "\n");
			}
		}
		private function getWeeklyChartListHandler(event:Event):void
		{
			trace(_tag.xml);
			var charts:XMLList = _tag.xml.weeklychartlist.chart;
			for each(var chart:XML in charts)
			{
				trace("Chart from: " + chart.@from);
				trace("Chart to: " + chart.@to + "\n");
			}
		}
		private function searchHandler(event:Event):void
		{
			trace(_tag.xml);
			var opensearchNs:Namespace = new Namespace("http://a9.com/-/spec/opensearch/1.1/");
			var results:XMLList = _tag.xml.results;
			var tags:XMLList = _tag.xml.results.tagmatches.tag;
			trace("Search totalResults: " + results.opensearchNs::totalResults);
			trace("Search startIndex: " + results.opensearchNs::startIndex);
			trace("Search itemsPerPage: " + results.opensearchNs::itemsPerPage + "\n");
			
			for each(var tag:XML in tags)
			{
				trace("Tag name: " + tag.name);
				trace("Tag url: " + tag.url);
				trace("Tag count: " + tag.count + "\n");
			}
		}
	}
}