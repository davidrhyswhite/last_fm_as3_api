package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import fm.last.*;
	
	public class UserExample extends Sprite
	{
		private var _user:User = new User();
		
		public function UserExample()
		{
		//	_user.getEvents("mokele");
		//	_user.addEventListener(User.GET_EVENTS, getEventsHandler);
			
		//	_user.getFriends("polyneme", true);
		//	_user.addEventListener(User.GET_FRIENDS, getFriendsHandler);
			
		//	_user.getInfo();
		//	_user.addEventListener(User.GET_INFO, getInfoHandler);
			
		//	_user.getLovedTracks("polyneme");
		//	_user.addEventListener(User.GET_LOVED_TRACKS, getLovedTracksHandler);
			
		//	_user.getNeighbours("polyneme");
		//	_user.addEventListener(User.GET_NEIGHBOURS, getNeighboursHandler);
			
		//	_user.getPastEvents("mokele");
		//	_user.addEventListener(User.GET_PAST_EVENTS, getPastEventsHandler);
			
			_user.getPlaylists("polyneme");
			_user.addEventListener(User.GET_PLAYLISTS, getPlaylistsHandler);
			
		//	_user.getRecentTracks("polyneme");
		//	_user.addEventListener(User.GET_RECENT_TRACKS, getRecentTracksHandler);
			
		//	_user.getRecommendedEvents("polyneme");
		//	_user.addEventListener(User.GET_RECOMMENDED_EVENTS, getRecommendedEventsHandler);
			
		//	_user.getTopAlbums("polyneme");
		//	_user.addEventListener(User.GET_TOP_ALBUMS, getTopAlbumsHandler);
			
		//	_user.getTopArtists("polyneme");
		//	_user.addEventListener(User.GET_TOP_ARTISTS, getTopArtistsHandler);
			
		//	_user.getTopTags("polyneme");
		//	_user.addEventListener(User.GET_TOP_TAGS, getTopTagsHandler);
			
		//	_user.getTopTracks("polyneme");
		//	_user.addEventListener(User.GET_TOP_TRACKS, getTopTracksHandler);
			
		//	_user.getWeeklyAlbumChart("polyneme");
		//	_user.addEventListener(User.GET_WEEKLY_ALBUM_CHART, getWeeklyAlbumChartHandler);
			
		//	_user. getWeeklyArtistChart("polyneme");
		//	_user.addEventListener(User.GET_WEEKLY_ARTIST_CHART, getWeeklyArtistChartHandler);
			
		//	_user.getWeeklyChartList("polyneme");
		//	_user.addEventListener(User.GET_WEEKLY_CHART_LIST, getWeeklyChartListHandler);
			
		//	_user.getWeeklyTrackChart("polyneme");
		//	_user.addEventListener(User.GET_WEEKLY_TRACK_CHART, getWeeklyTrackChartHandler);
			
		}
		
		private function getEventsHandler(e:Event):void
		{
			trace(_user.xml);
			
			var geoNs:Namespace = new Namespace("http://www.w3.org/2003/01/geo/wgs84_pos#");
			var events:XMLList = _user.xml.events.event;
			
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
		
		private function getFriendsHandler(event:Event):void
		{
			trace(_user.xml);
			var users:XMLList = _user.xml.friends.user;
			for each(var user:XML in users)
			{
				trace("Friends name: " + user.name);
				trace("Friends realname: " + user.realname);
				for each(var image:XML in user.image)
				{
					trace("Image size: " + image.@size + " and URL: " + image);
				}
				trace("Friends url: " + user.url);
				trace("Friends recent track");
				trace("Artist name: " + user.recenttrack.artist.name);
				trace("Artist mbid: " + user.recenttrack.artist.mbid);
				trace("Artist url: " + user.recenttrack.artist.url);
				trace("Artist name: " + user.recenttrack.artist.name);
				trace("Artist track name: " + user.recenttrack.name);
				trace("Artist track mbid: " + user.recenttrack.mbid);
				trace("Artist track url: " + user.recenttrack.url + "\n");
			}
		}
		
		private function getInfoHandler(event:Event):void
		{
			trace(_user.xml);
			var user:XMLList = _user.xml.user;
			
			trace("User id: " + user.id);
			trace("User name: " + user.name);
			trace("User url: " + user.url);
			trace("User image: " + user.image);
			trace("User lang: " + user.lang);
			trace("User country: " + user.country);
			trace("User age: " + user.age);
			trace("User gender: " + user.gender);
			trace("User subscriber: " + user.subscriber);
			trace("User playcount: " + user.playcount);
			trace("User playlists: " + user.playlists);
		}
		
		private function getLovedTracksHandler(event:Event):void
		{
			trace(_user.xml);
			var tracks:XMLList = _user.xml.lovedtracks.track;
			
			for each(var track:XML in tracks)
			{
				trace("Track name: " + track.name);
				trace("Track mbid: " + track.mbid);
				trace("Track url: " + track.url);
				trace("Track date: " + track.date);
				trace("Track mbid: " + track.mbid);
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
		
		private function getNeighboursHandler(event:Event):void
		{
			trace(_user.xml);
			var users:XMLList = _user.xml.neighbours.user;
			for each(var user:XML in users)
			{
				trace("Neighbour name: " + user.name);
				trace("Neighbour url: " + user.url);
				for each(var image:XML in user.image)
				{
					trace("Image size: " + image.@size + " and URL: " + image);
				}
				trace("Neighbour match: " + user.match + "\n");
			}
		}
		
		private function getPastEventsHandler(e:Event):void
		{
			trace(_user.xml);
			
			var geoNs:Namespace = new Namespace("http://www.w3.org/2003/01/geo/wgs84_pos#");
			var events:XMLList = _user.xml.events.event;
			
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
		
		private function getPlaylistsHandler(e:Event):void
		{
			trace(_user.xml);
			var playlists:XMLList = _user.xml.playlists.playlist;
			for each (var playlist:XML in playlists)
			{
				trace("Playlist id: " + playlist.id);
				trace("Playlist title: " + playlist.title);
				trace("Playlist description: " + playlist.description);
				trace("Playlist date: " + playlist.date);
				trace("Playlist size: " + playlist.size);
				trace("Playlist duration: " + playlist.duration);
				trace("Playlist streamable: " + playlist.streamable);
				trace("Playlist creator: " + playlist.creator);
				trace("Event url: " + playlist.url);
				for each(var image:XML in playlist.image)
				{
					trace("Image size: " + image.@size + " and URL: " + image);
				}
				trace("\n");
			}
		}
		
		private function getRecentTracksHandler(e:Event):void
		{
			trace(_user.xml);
			var tracks:XMLList = _user.xml.recenttracks.track;
			
			for each(var track:XML in tracks)
			{
				trace("Artist name: " + track.artist);
				trace("Artist mbid: " + track.artist.@mbid);
				trace("Track name: " + track.name);
				trace("Track streamable: " + track.streamable);
				trace("Track mbid: " + track.mbid);
				trace("Track url: " + track.url);
				trace("Album name: " + track.album)
				trace("Album mbid: " + track.album.@mbid);
				trace("Track url: " + track.url);
				for each(var image:XML in track.image)
				{
					trace("Image size: " + image.@size + " and URL: " + image);
				}
				trace("Date played: " + track.date + "\n");
			}
		}
		
		private function getRecommendedEventsHandler(e:Event):void
		{
			trace(_user.xml);
			var tracks:XMLList = _user.xml.recenttracks.track;
			
			for each(var track:XML in tracks)
			{
				trace("Artist name: " + track.artist);
				trace("Artist mbid: " + track.artist.@mbid);
				trace("Track name: " + track.name);
				trace("Track streamable: " + track.streamable);
				trace("Track mbid: " + track.mbid);
				trace("Track url: " + track.url);
				trace("Album name: " + track.album)
				trace("Album mbid: " + track.album.@mbid);
				trace("Track url: " + track.url);
				for each(var image:XML in track.image)
				{
					trace("Image size: " + image.@size + " and URL: " + image);
				}
				trace("Date played: " + track.date + "\n");
			}
		}
		
		private function getTopAlbumsHandler(e:Event):void
		{
			trace(_user.xml);
			var albums:XMLList =  _user.xml.topalbums.album;
			
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
		
		private function getTopArtistsHandler(e:Event):void
		{
			trace(_user.xml);
			var artists:XMLList = _user.xml.topartists.artist;
			for each(var artist:XML in artists)
			{
				trace("Artist rank: " + artist.@rank);
				trace("Artist name: " + artist.name);
				trace("Artist playcount: " + artist.playcount);
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
		
		private function getTopTagsHandler(e:Event):void
		{
			trace(_user.xml);
			var tags:XMLList = _user.xml.toptags.tag;
			for each(var tag:XML in tags)
			{
				trace("Tag name: " + tag.name);
				trace("Tag count: " + tag.count);
				trace("Tag url: " + tag.url + "\n");
			}
		}
		
		private function getTopTracksHandler(e:Event):void
		{
			trace(_user.xml);
			var tracks:XMLList = _user.xml.toptracks.track;
			
			for each(var track:XML in tracks)
			{
				trace("Track rack: " + track.@rank);
				trace("Track name: " + track.name);
				trace("Track playcount: " + track.playcount);
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
		
		private function getWeeklyAlbumChartHandler(e:Event):void
		{
			trace(_user.xml);
			var albums:XMLList = _user.xml.weeklyalbumchart.album;
			for each(var album:XML in albums)
			{
				trace("Album rank: " + album.@rank);
				trace("Artist name: " + album.artist);
				trace("Artist mbid: " + album.artist.@mbid);
				trace("Album name: " + album.name);
				trace("Album mbid: " + album.mbid);
				trace("Album playcount: " + album.playcount);
				trace("Album url: " + album.url + "\n");
			}
		}
		
		private function getWeeklyArtistChartHandler(e:Event):void
		{
			trace(_user.xml);
			var artists:XMLList = _user.xml.weeklyartistchart.artist;
			for each(var artist:XML in artists)
			{
				trace("Artist rank: " + artist.@rank);
				trace("Artist name: " + artist.name);
				trace("Artist mbid: " + artist.mbid);
				trace("Artist playcount: " + artist.playcount);
				trace("Artist url: " + artist.url + "\n");
			}
		}
		
		private function getWeeklyChartListHandler(e:Event):void
		{
			trace(_user.xml);
			var charts:XMLList = _user.xml.weeklychartlist.chart;
			for each(var chart:XML in charts)
			{
				trace("Chart from: " + chart.@from);
				trace("Chart to: " + chart.@to + "\n");
			}
		}
		
		private function getWeeklyTrackChartHandler(e:Event):void
		{
			trace(_user.xml);
			var tracks:XMLList = _user.xml.weeklytrackchart.track;
			for each(var track:XML in tracks)
			{
				trace("Track rank: " + track.@rank);
				trace("Artist name: " + track.artist);
				trace("Artist mbid: " + track.artist.@mbid);
				trace("Track name: " + track.name);
				trace("Track mbid: " + track.mbid);
				trace("Track playcount: " + track.playcount);
				trace("Track url: " + track.url + "\n");
			}
		}
	}
}