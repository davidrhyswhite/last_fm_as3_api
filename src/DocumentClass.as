package {
	import com.gsolo.encryption.MD5;
	
	import flash.display.Sprite;
	import flash.events.*;
	import flash.net.*;
	import flash.utils.ByteArray;
	
	import fm.last.*;

	public class DocumentClass extends Sprite
	{
		private var request:URLRequest;
		private var loader:URLLoader = new URLLoader();
		private var signature:String;
		
		private var _auth:Auth = new Auth();
		
		public function DocumentClass()
		{
			
			login();
		//	getSession();
		//	getApiSig();
        }
        
        private function login():void
        {
        	_auth.requestToken();
			_auth.addEventListener(Auth.TOKEN_LOADED, redirectToKeyer);
		}
		
        private function redirectToKeyer(event:Event):void {
        	navigateToURL(request);
        }

        private function completeHandler(event:Event):void 
        {
			var response:XML = XML(event.target.data);
			LastFMBase.sk = response.session.key;
			//api signature = md5("api_keyxxxxxxxxmethodauth.getSessiontokenxxxxxxx3")
        }

        private function errorEventHandler(event:IOErrorEvent):void 
        {
			//navigateToURL(request);
			trace(event);
			//api signature = md5("api_keyxxxxxxxxmethodauth.getSessiontokenxxxxxxx3")
        }
        private function getSession():void	
		{
			var byteArr:ByteArray = new ByteArray();
			var variables:URLVariables = new URLVariables();
			variables.api_key = LastFMBase.API_KEY
			variables.api_sig = MD5.encrypt("api_key" + LastFMBase.API_KEY + "methodauth.getsessiontoken" + LastFMBase.TOKEN + LastFMBase.SECRET)
			variables.sk = LastFMBase.sk;
			variables.token = LastFMBase.TOKEN
			trace("api_key = " + variables.api_key);
			trace("api_sig = " + variables.api_sig);
			trace("token = " + variables.token);
			trace("sk = " + variables.sk);
			
		//	var url:String = "http://ws.audioscrobbler.com/2.0/?method=auth.getsession&api_key=" + variables.api_key + "&api_sig=" + variables.api_sig + "&token=" + variables.token;
			var url:String = "http://ws.audioscrobbler.com/2.0/?api_key=" +  variables.api_key + "&api_sig=" + variables.api_sig + "&artist=Autechre&method=track.love&sk=" + variables.sk + "&track=Glitch";
			trace(byteArr.writeUTFBytes(url));
			request = new URLRequest(url);
			request.method = URLRequestMethod.POST;

			loader.addEventListener(Event.COMPLETE, completeHandler);
			loader.addEventListener(IOErrorEvent.IO_ERROR, errorEventHandler);
			loader.load(request);
		}
	}
}