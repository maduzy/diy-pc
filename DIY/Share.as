package DIY
{
	import flash.net.navigateToURL;
	import flash.net.URLVariables;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;



	public class Share extends MovieClip
	{

		public function Share()
		{
			this.addEventListener(MouseEvent.ROLL_OVER, onRollOverHandler);
			this.addEventListener(MouseEvent.ROLL_OUT, onRollOutHandler);
			this.addEventListener(MouseEvent.CLICK, shareFB);
			buttonMode = true;
		}

		public function shareFB(evt:MouseEvent):void
		{
			var shareVars:URLVariables = new URLVariables();
			shareVars.u = 'http://dyi-pc.net16.net';
			shareVars.t = 'DIY-PC';

			var path:URLRequest = new URLRequest('http://www.facebook.com/sharer.php');
			path.data = shareVars;
			path.method = URLRequestMethod.GET;

			navigateToURL(path, '_blank');
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