Last.fm ActionScript 3 API
==========================

his package is an Actionscript 3 implementation of Last.fm's 2.0 API. The package contains all GET and POST methods for all web services with examples for each service.

The package is still very new so there's still lot of code that needs to be re-looked at and cleaned up. This project was originally hosted @ https://code.google.com/p/lastfm-as3-api/

To use:

1. Signup for an API account at [http://www.last.fm/api/account/](http://www.last.fm/api/account/)
2. Download a copy of the MD5 encryption library for AS3 from [http://gsolofp.blogspot.com/2006/01/actionscript-3-md5-and-sha1.html](http://gsolofp.blogspot.com/2006/01/actionscript-3-md5-and-sha1.html)
3. Copy your API_KEY and SECRET into the constants in the LastFMBase class.
4. Use the User.getToken() method to generate a valid TOKEN and copy/paste that into your LastFMBase class.
5. Use the User.getSessionKey() method to generate a valid SESSION_KEY and copy/paste that into your LastFMBase class.


Try an example:

1. [http://www.spry-soft.com/LastFMFlex/index.html](http://www.spry-soft.com/LastFMFlex/index.html)
2. Just enter you Last.fm username and load the 'Gravity Graph'
3. Expand and collapse your browsers window just for 'kicks and giggles'

View documentation:

[http://www.spry-soft.com/LastFMAS3API/documentation/index.html](http://www.spry-soft.com/LastFMAS3API/documentation/index.html)

Licence
-------

This application is released under the MIT licence.