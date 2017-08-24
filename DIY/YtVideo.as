package DIY
{
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.ui.MouseCursor;
	import flash.display.MovieClip;
	import flash.system.Security;
	import flash.events.MouseEvent;

	Security.allowDomain("www.youtube.com");

	public class YtVideo extends MovieClip
	{
		var player:Object = new Object  ;

		public function YtVideo()
		{

			var loader:Loader = new Loader  ;
			loader.load(new URLRequest("http://www.youtube.com/apiplayer?version=3"));
			
			loader.contentLoaderInfo.addEventListener(Event.INIT,onInit);
			
			var btnPlay:PlayYtVid = new PlayYtVid();
			var btnPause:PauseYtVid = new PauseYtVid();
			var btnStop:StopYtVid = new StopYtVid();
			var btnMute:MuteYtVid = new MuteYtVid();
			var btnUnmute:UnmuteYtVid = new UnmuteYtVid();
			
			var cases:GotoCaseBtn = new GotoCaseBtn();
			var mb:GotoMbBtn = new GotoMbBtn();
			var cpu:GotoCpuBtn = new GotoCpuBtn();
			var hdd:GotoHddBtn = new GotoHddBtn();
			var gfx:GotoGfxBtn = new GotoGfxBtn();
			var psu:GotoPsuBtn = new GotoPsuBtn();
			var ram:GotoRamBtn = new GotoRamBtn();
			
			btnPlay.x = 0;
			btnPlay.y = -20 ;
			
			btnPause.x = btnPlay.x + 100;
			btnPause.y = btnPlay.y;
			
			btnStop.x = btnPause.x + 100;
			btnStop.y = btnPlay.y;
			
			btnMute.x = btnStop.x + 100;
			btnMute.y = btnPlay.y;
			
			btnUnmute.x = btnMute.x + 100;
			btnUnmute.y = btnPlay.y;

			cases.x = -60;
			cases.y = 510;

			mb.x = cases.x + 110;
			mb.y = cases.y;

			cpu.x = mb.x + 110;
			cpu.y = cases.y;

			hdd.x = cpu.x + 110;
			hdd.y = cases.y;

			gfx.x = hdd.x + 110;
			gfx.y = cases.y;

			psu.x = gfx.x + 110;
			psu.y = cases.y;

			ram.x = psu.x + 110;
			ram.y = cases.y;
			
			
			addChild(btnPlay);
			addChild(btnPause);
			addChild(btnStop);
			addChild(btnMute);
			addChild(btnUnmute);
			
			addChild(cases);
			addChild(mb);
			addChild(cpu);
			addChild(hdd);
			addChild(gfx);
			addChild(psu);
			addChild(ram);


			cases.addEventListener(MouseEvent.MOUSE_DOWN,seekcase);
			mb.addEventListener(MouseEvent.MOUSE_DOWN,seekmb);
			cpu.addEventListener(MouseEvent.MOUSE_DOWN,seekcpu);
			hdd.addEventListener(MouseEvent.MOUSE_DOWN,seekhdd);
			psu.addEventListener(MouseEvent.MOUSE_DOWN,seekpsu);
			gfx.addEventListener(MouseEvent.MOUSE_DOWN,seekgfx);
			ram.addEventListener(MouseEvent.MOUSE_DOWN,seekram);



			function onInit(e:Event):void
			{

				addChild(loader);

				player = loader.content;

				player.addEventListener("onReady",onPlayerReady);


			}

			function onPlayerReady(e:Event):void
			{

				player.setSize(640,480);


				player = loader.content;
				
				//player.playVideo();
				player.seekTo(59);

		
				player.loadVideoById("W4Js2A1qdB8",3);
			}


			function seekcase()
			{


				player.seekTo(96);
			}

			function seekmb()
			{


				player.seekTo(158);
			}



			function seekcpu()
			{
				player.seekTo(226);
			}

			function seekhdd()
			{
				player.seekTo(648);
			}

			function seekpsu()
			{
				player.seekTo(573);
			}
			function seekgfx()
			{
				player.seekTo(858);
			}

			function seekram()
			{
				player.seekTo(527);
			}





			btnPlay.addEventListener(MouseEvent.CLICK, playVid);
			
			function playVid(e:MouseEvent):void
			{
			
			player.playVideo();
			
			}
			
			btnPause.addEventListener(MouseEvent.CLICK, pauseVid);
			
			function pauseVid(e:MouseEvent):void
			{
			
			player.pauseVideo();
			
			}
			
			btnStop.addEventListener(MouseEvent.CLICK, stopVid);
			
			function stopVid(e:MouseEvent):void
			{
			
			player.stopVideo();
			
			}
			
			btnMute.addEventListener(MouseEvent.CLICK, muteVid);
			
			function muteVid(e:MouseEvent):void
			{
			
			player.mute();
			
			}
			
			btnUnmute.addEventListener(MouseEvent.CLICK, UnmuteVid);
			
			function UnmuteVid(e:MouseEvent):void
			{
			
			player.unMute();
			
			}
			
		}

		public function stopVid()
		{
			player.stopVideo();
		}
	}

}
