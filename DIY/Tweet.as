package DIY
{
	import flash.net.navigateToURL;
	import flash.net.URLVariables;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;

	public class Tweet extends MovieClip
	{

		public function Tweet()
		{
			this.addEventListener(MouseEvent.CLICK, tweet);
			this.addEventListener(MouseEvent.ROLL_OVER, onRollOverHandler);
			this.addEventListener(MouseEvent.ROLL_OUT, onRollOutHandler);
			buttonMode = true;
		}

		public function tweet(evt:MouseEvent)
		{
			var tweetVars:URLVariables = new URLVariables();
			tweetVars.status = "DIY - PC: Build your own PC - http://dyi-pc.net16.net";


			var path:URLRequest = new URLRequest("http://twitter.com/home");
			path.data = tweetVars;
			path.method = URLRequestMethod.GET;

			navigateToURL(path, "_blank");
		}

		function onRollOverHandler(myEvent:MouseEvent)
		{
			this.alpha = 0.7;
		}

		function onRollOutHandler(myEvent:MouseEvent)
		{
			this.alpha = 1;
		}

	}

}