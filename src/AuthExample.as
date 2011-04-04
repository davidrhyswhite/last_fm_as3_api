package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import fm.last.*;
	
	public class AuthExample extends Sprite
	{
		private var _auth:Auth = new Auth();
		private var _group:Group = new Group("IDM");
		
		public function AuthExample()
		{
		//	_auth.requestToken();
			
			_auth.getSession();
			_auth.addEventListener(Auth.SESSION_LOADED, getSessionHandler);
		}
		
		private function getSessionHandler(event:Event):void
		{
			trace(_auth.xml);
			LastFMBase.sk = _auth.xml.session.key;
			trace(LastFMBase.sk);
		}
	}
}