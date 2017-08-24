package DIY
{
	import flash.system.Security;

	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.display.Stage;
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.printing.*;
	import fl.controls.ComboBox;
	import fl.controls.List;
	import flash.text.*;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import fl.controls.CheckBox;
	import fl.controls.Slider;
	import fl.controls.SliderDirection;
	import flash.events.Event;
	import fl.events.SliderEvent;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.TweenEvent;

	public class Start extends MovieClip
	{


		var budget:TextField = new TextField  ;
		var error:TextField = new TextField  ;
		var btngo:Btngo = new Btngo  ;
		var uses:ComboBox = new ComboBox  ;
		public var parts:Parts;
		var video:YtVideo;
		var darkener:Shape;
		var tweet:Tweet = new Tweet();
		var share:Share = new Share();
		var logo:Logo = new Logo();
		var recommend:Recommendtable = new Recommendtable();

		Security.allowDomain("www.youtube.com");
		Security.allowDomain("amazon.co.uk");

		Security.allowDomain("dyi-pc.net16.net");
		Security.allowDomain("s.ytimg.com");

		var videobtn:PlayVid = new PlayVid();
		var closevideo:CloseVidBtn;
		var printparts:PrintListBtn = new PrintListBtn();
		var printerpage:Sprite = new Sprite();
		var btnbudget:NewBudgetBtn = new NewBudgetBtn();
		var printobj:PrintJob;

		var slide:Slider = new Slider();;

		var light:Light = new Light();
		
		var budgetminlabel:TextField = new TextField();
		var budgetmaxlabel:TextField = new TextField();


		public function Start()
		{
			
			
			
			
			slide.move(10,10);
			slide.liveDragging = true;

			slide.x = 300;
			slide.y = 340;
			slide.snapInterval = 10;
			slide.minimum = 300;
			slide.maximum = 1000;
			slide.setSize(550,50);
			

			slide.addEventListener(SliderEvent.CHANGE, announceChange);


			var lightpulse:Tween = new Tween(light,"alpha",None.easeIn,0,2,1,true);
			light.x = 285;
			light.y = 90;
			

			lightpulse.addEventListener(TweenEvent.MOTION_FINISH, onFinish);
			function onFinish(e:TweenEvent):void
			{
				lightpulse.yoyo();
			}


			logo.x = 175;
			logo.y = 40;
			addChild(logo);
			addChild(light);

			recommend.alpha = 0.5;
			recommend.x = 430;
			recommend.y = 410;
			addChild(recommend);

			tweet.x = 10;
			tweet.y = 575;
			addChild(tweet);

			share.x = tweet.x + 50;
			share.y = tweet.y;
			addChild(share);

			btngo.y = 375;
			btngo.x = 500;

			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color = 0x333333;
			txtFormat.font = "_sans";
			txtFormat.size = 12;
			error.selectable = false;
			error.defaultTextFormat = txtFormat;
			error.autoSize = TextFieldAutoSize.LEFT;
			error.width = 350;
			error.y = 230;
			error.x = 450;

			txtFormat.color = 0x666666;
			txtFormat.align = TextFormatAlign.CENTER;
			budget.defaultTextFormat = txtFormat;

			budget.border = true;
			budget.borderColor = 0x999999;
			budget.width = 80;
			budget.height = 20;
			budget.selectable = false;
			budget.x = 510;
			budget.y = 300;
			budget.text = "Budget £";
			
			
			budgetminlabel.defaultTextFormat = txtFormat;
			budgetminlabel.selectable = false;
			budgetminlabel.x = 220;
			budgetminlabel.y = 330;
			budgetminlabel.text = "£ 300";
			addChild(budgetminlabel);
			
			budgetmaxlabel.defaultTextFormat = txtFormat;
			budgetmaxlabel.selectable = false;
			budgetmaxlabel.x = 830;
			budgetmaxlabel.y = budgetminlabel.y;
			budgetmaxlabel.text = "£ 1000";
			addChild(budgetmaxlabel);
			
			
			addChild(slide);

			function announceChange(e:SliderEvent):void
			{
				trace("Budget value is now: " + e.target.value);
				budget.text = "£ " + slide.value.toString();


			}



			usabilityList();

			/*budgetinput.addEventListener(MouseEvent.CLICK, clickbudget);
			
			function clickbudget()
			{
			budgetinput.text = "";
			}
			*/

			btngo.addEventListener(MouseEvent.CLICK,showmylist);


			videobtn.x = 980;
			videobtn.y = 570;
			addChild(videobtn);

			videobtn.addEventListener(MouseEvent.MOUSE_DOWN,playvideo);


			addChild(budget);
			addChild(btngo);



			uses.dropdown.rowHeight = 40;
			uses.width = 130;
			uses.y = 260;
			uses.x = 485;

			addChild(uses);


			addChild(error);

			printparts.x = 880;
			printparts.y = videobtn.y;


			function playvideo()
			{


				darkener = new Shape  ;
				darkener.graphics.beginFill(0x000000,.8);
				darkener.graphics.drawRect(0,0,stage.stageWidth,stage.stageHeight);
				darkener.graphics.endFill();
				closevideo = new CloseVidBtn() ;
				closevideo.y = 30;
				closevideo.x = 770;


				addChild(darkener);
				addChild(closevideo);

				closevideo.addEventListener(MouseEvent.MOUSE_DOWN,removevideo);

				function removevideo()
				{
					removeChild(video);
					video.stopVid();

					removeChild(darkener);
					removeChild(closevideo);
					closevideo.removeEventListener(MouseEvent.MOUSE_DOWN,removevideo);

				}


				video = new YtVideo  ;
				video.x = 230;
				video.y = 50;
				addChild(video);
			}



			function showmylist(evt:MouseEvent):void
			{

				parts = new Parts();
				parts.budget = slide.value;

				//parts.budget = parseFloat(budgetinput.text);



				if ((isNaN(parts.budget) || uses.selectedItem.label == "Select usability..."))
				{
					parts = null;

					error.text = "Please select a usability for your PC.";
				}
				else
				{


					if (uses.selectedItem.label == "Gaming")
					{
						parts.usability = "gaming";
					}
					if (uses.selectedItem.label == "3D Modeling")
					{
						parts.usability = "3d modelling";
					}
					if (uses.selectedItem.label == "Productivity")
					{
						parts.usability = "productivity";
					}
					if (uses.selectedItem.label == "Web Browsing")
					{
						parts.usability = "web browsing";
					}



					parts.getminmaxforusablityandbudget(parts.budget,parts.usability);



					trace(parts.budget);
					printerpage.addChild(parts);

					addChild(printerpage);

					removeChild(budgetminlabel);
					removeChild(budgetmaxlabel);
					removeChild(budget);
					removeChild(slide);
					removeChild(recommend);
					removeChild(logo);
					removeChild(light);
					removeChild(tweet);
					removeChild(share);
					removeChild(error);
					removeChild(btngo);
					removeChild(uses);

					addChild(printparts);
					printparts.addEventListener(MouseEvent.MOUSE_DOWN, printpartslist);

					btnbudget.x = 670;
					btnbudget.y = 570;
					addChild(btnbudget);
					btnbudget.addEventListener(MouseEvent.MOUSE_UP, resetMe);




					function resetMe(event:MouseEvent):void
					{
						var url:String = stage.loaderInfo.url;
						var request:URLRequest = new URLRequest(url);
						navigateToURL(request,"_level0");
					}



					function printpartslist()
					{
						printobj = new PrintJob();


						if (printobj.start())
						{
							printerpage.scaleX = 0.55;
							printerpage.scaleY = printerpage.scaleX;


							try
							{

								printobj.addPage(printerpage);


							}
							catch (e:Error)
							{
								trace("Flash wasn't able to print");// handle error 
							}



							printobj.send();

							printerpage.scaleX = 1;
							printerpage.scaleY = printerpage.scaleX;

						}

					}
				}

			}


			function usabilityList():void
			{

				uses.addItem({label:"Select usability..."});

				uses.addItem({label:"Gaming"});

				uses.addItem({label:"3D Modeling"});

				uses.addItem({label:"Productivity"});

				uses.addItem({label:"Web Browsing"});

			}







		}


	}

}