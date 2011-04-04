package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import fm.last.*;

	public class GroupExample extends Sprite
	{
		private var _group:Group = new Group("IDM");
		
		public function GroupExample()
		{
			_group.getWeeklyAlbumChart();
			_group.addEventListener(Group.WEEKLY_ALBUM_CHART, getWeeklyAlbumChartHandler);
			
			_group.getWeeklyArtistChart();
			_group.addEventListener(Group.WEEKLY_ARTIST_CHART, getWeeklyArtistChartHandler);
			
			_group.getWeeklyChartList();
			_group.addEventListener(Group.WEEKLY_CHART_LIST, getWeeklyChartListHandler);
			
			_group.getWeeklyTrackChart();
			_group.addEventListener(Group.WEEKLY_TRACK_CHART, getWeeklyTrackChartHandler);
		}
		
        
        private function getWeeklyAlbumChartHandler(event:Event):void
        {
        	var albums:XMLList = _group.xml.weeklyalbumchart.album; 
        	trace("Weekly album chart \n");
        	for each(var album:XML in albums)
        	{
				trace("Album rank: " + album.@rank);
				trace("Artist: " + album.artist);
				trace("Name: " + album.name);
				trace("Playcount: " + album.playcount);
				trace("URL: " + album.url + "\n");
        	}
        }
        
        private function getWeeklyArtistChartHandler(event:Event):void
        {
			var artists:XMLList = _group.xml.weeklyartistchart.artist;
			trace("Weekly artist chart \n");
			
			for each(var artist:XML in artists)
			{
				trace("Artist rank: " + artist.@rank);
				trace("Artist: " + artist.name);
				trace("Playcount: " + artist.playcount);
				trace("URL: " + artist.url + "\n");
			}
        }
        
        private function getWeeklyChartListHandler(event:Event):void
        {
			var charts:XMLList = _group.xml.weeklychartlist.chart;
			trace("Weekly artist chart \n");
			
			for each(var chart:XML in charts)
			{
				trace("Chart from: " + chart.@from + " Chart to:" + chart.@to + "\n");
			}
        }
         
        private function getWeeklyTrackChartHandler(event:Event):void
        {
        	var tracks:XMLList = _group.xml.weeklytrackchart.track;
        	trace("Weekly track chart \n");

			for each(var track:XML in tracks)
			{
				trace("Artist: " + track.artist);
				trace("Name: " + track.name);
				trace("Playcount: " + track.playcount);
				for each(var image:XML in track.image)
				{
					trace("Image size: " + image.@size + " and URL: " + image);
				}
				trace("URL: " + track.url + "\n");
			}
        }
	}
}