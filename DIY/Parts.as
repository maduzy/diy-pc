package DIY
{

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.display.Loader;
	import flash.text.TextFormat;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.URLLoaderDataFormat;
	import flash.utils.getDefinitionByName;
	import flash.net.URLRequestMethod;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.EventDispatcher;
	import flash.utils.*;

	import XML;
	import flash.net.navigateToURL;
	import flash.printing.PrintJob;
	import flash.display.Stage;



	public class Parts extends Sprite
	{
		public var budget:Number;
		public var usability:String;
		var motherboard:Returnxml;
		var cases:Returnxml;
		var cpu:Returnxml;
		var hdd:Returnxml;
		var ram:Returnxml;
		var gfx:Returnxml;
		var psu:Returnxml;
		var motherboardprice:Number;
		var caseprice:Number;
		var cpuprice:Number;
		var gfxprice:Number;
		var ramprice:Number;
		var hddprice:Number;
		var psuprice:Number;
		var gfxmin:Number;
		var cpumin:Number;
		var rammin:Number;
		var psumin:Number;
		var casemin:Number;
		var hddmin:Number;
		var mbmin:Number;
		var gfxmax:Number;
		var cpumax:Number;
		var rammax:Number;
		var psumax:Number;
		var casemax:Number;
		var hddmax:Number;
		var mbmax:Number;
		var highDivis:Number = 4;
		var medDivis:Number = 10;
		var lowDivis:Number = 14;
		var motherboarditem:Number = 0;
		var caseitem:Number = 0;
		var cpuitem:Number = 0;
		var hdditem:Number = 0;
		var ramitem:Number = 0;
		var gfxitem:Number = 0;
		var psuitem:Number = 0;

		public function Parts()
		{
			this.addEventListener(Event.ADDED_TO_STAGE,removerect);

			function removerect(e:Event):void
			{
				stage.stageFocusRect = false;
			}

			var textcontainermb:Sprite = new Sprite();
			var motherboardtitlefield:TextField = new TextField();
			motherboardtitlefield.autoSize = TextFieldAutoSize.LEFT;
			var motherboardpricefield:TextField = new TextField();
			motherboardpricefield.autoSize = TextFieldAutoSize.LEFT;
			motherboardtitlefield.x = 90;
			motherboardtitlefield.y = 10;
			motherboardpricefield.x = motherboardtitlefield.x;
			motherboardpricefield.y = motherboardtitlefield.y + 20;
			motherboardtitlefield.selectable = false;
			textcontainermb.buttonMode = true;
			textcontainermb.mouseChildren = false;
			textcontainermb.addChild(motherboardtitlefield);


			var textcontainercase:Sprite = new Sprite();
			var casetitlefield:TextField = new TextField();
			casetitlefield.autoSize = TextFieldAutoSize.LEFT;
			var casepricefield:TextField = new TextField();
			casepricefield.autoSize = TextFieldAutoSize.LEFT;
			casetitlefield.x = motherboardtitlefield.x;
			casetitlefield.y = motherboardtitlefield.y + 82;
			casepricefield.x = casetitlefield.x;
			casepricefield.y = casetitlefield.y + 20;
			casetitlefield.selectable = false;
			textcontainercase.buttonMode = true;
			textcontainercase.mouseChildren = false;
			textcontainercase.addChild(casetitlefield);

			var textcontainercpu:Sprite = new Sprite();
			var cputitlefield:TextField = new TextField();
			cputitlefield.autoSize = TextFieldAutoSize.LEFT;
			var cpupricefield:TextField = new TextField();
			cpupricefield.autoSize = TextFieldAutoSize.LEFT;
			cputitlefield.x = casetitlefield.x;
			cputitlefield.y = casetitlefield.y + 82;
			cpupricefield.x = cputitlefield.x;
			cpupricefield.y = cputitlefield.y + 20;
			cputitlefield.selectable = false;
			textcontainercpu.buttonMode = true;
			textcontainercpu.mouseChildren = false;
			textcontainercpu.addChild(cputitlefield);

			var textcontainerhdd:Sprite = new Sprite();
			var hddtitlefield:TextField = new TextField();
			hddtitlefield.autoSize = TextFieldAutoSize.LEFT;
			var hddpricefield:TextField = new TextField();
			hddpricefield.autoSize = TextFieldAutoSize.LEFT;
			hddtitlefield.x = cputitlefield.x;
			hddtitlefield.y = cputitlefield.y + 82;
			hddpricefield.x = hddtitlefield.x;
			hddpricefield.y = hddtitlefield.y + 20;
			hddtitlefield.selectable = false;
			textcontainerhdd.buttonMode = true;
			textcontainerhdd.mouseChildren = false;
			textcontainerhdd.addChild(hddtitlefield);

			var textcontainerram:Sprite = new Sprite();
			var ramtitlefield:TextField = new TextField();
			ramtitlefield.autoSize = TextFieldAutoSize.LEFT;
			var rampricefield:TextField = new TextField();
			rampricefield.autoSize = TextFieldAutoSize.LEFT;
			ramtitlefield.x = hddtitlefield.x;
			ramtitlefield.y = hddtitlefield.y + 82;
			rampricefield.x = ramtitlefield.x;
			rampricefield.y = ramtitlefield.y + 20;
			ramtitlefield.selectable = false;
			textcontainerram.buttonMode = true;
			textcontainerram.mouseChildren = false;
			textcontainerram.addChild(ramtitlefield);

			var textcontainergfx:Sprite = new Sprite();
			var gfxtitlefield:TextField = new TextField();
			gfxtitlefield.autoSize = TextFieldAutoSize.LEFT;
			var gfxpricefield:TextField = new TextField();
			gfxpricefield.autoSize = TextFieldAutoSize.LEFT;
			gfxtitlefield.x = ramtitlefield.x;
			gfxtitlefield.y = ramtitlefield.y + 82;
			gfxpricefield.x = gfxtitlefield.x;
			gfxpricefield.y = gfxtitlefield.y + 20;
			gfxtitlefield.selectable = false;
			textcontainergfx.buttonMode = true;
			textcontainergfx.mouseChildren = false;
			textcontainergfx.addChild(gfxtitlefield);

			var textcontainerpsu:Sprite = new Sprite();
			var psutitlefield:TextField = new TextField();
			psutitlefield.autoSize = TextFieldAutoSize.LEFT;
			var psupricefield:TextField = new TextField();
			psupricefield.autoSize = TextFieldAutoSize.LEFT;
			psutitlefield.x = gfxtitlefield.x;
			psutitlefield.y = gfxtitlefield.y + 82;
			psupricefield.x = psutitlefield.x;
			psupricefield.y = psutitlefield.y + 20;
			psutitlefield.selectable = false;
			textcontainerpsu.buttonMode = true;
			textcontainerpsu.mouseChildren = false;
			textcontainerpsu.addChild(psutitlefield);

			var totalpricefield:TextField = new TextField();
			totalpricefield.autoSize = TextFieldAutoSize.LEFT;
			totalpricefield.x = 90;
			totalpricefield.y = 565;

			var txtFormat:TextFormat = new TextFormat();
			txtFormat.color = 0x555555;
			txtFormat.font = "_sans";
			txtFormat.size = 12;
			motherboardtitlefield.defaultTextFormat = txtFormat;
			casetitlefield.defaultTextFormat = txtFormat;
			cputitlefield.defaultTextFormat = txtFormat;
			hddtitlefield.defaultTextFormat = txtFormat;
			ramtitlefield.defaultTextFormat = txtFormat;
			gfxtitlefield.defaultTextFormat = txtFormat;
			psutitlefield.defaultTextFormat = txtFormat;


			txtFormat.color = 0x333333;
			motherboardpricefield.defaultTextFormat = txtFormat;
			casepricefield.defaultTextFormat = txtFormat;
			cpupricefield.defaultTextFormat = txtFormat;
			hddpricefield.defaultTextFormat = txtFormat;
			rampricefield.defaultTextFormat = txtFormat;
			gfxpricefield.defaultTextFormat = txtFormat;
			psupricefield.defaultTextFormat = txtFormat;
			totalpricefield.defaultTextFormat = txtFormat;

			addChild(textcontainermb);
			//addChild(motherboardtitlefield);
			addChild(motherboardpricefield);
			addChild(textcontainercase);
			//addChild(casetitlefield);
			addChild(casepricefield);
			//addChild(cputitlefield);
			addChild(textcontainercpu);
			addChild(cpupricefield);
			//addChild(hddtitlefield);
			addChild(textcontainerhdd);
			addChild(hddpricefield);
			addChild(rampricefield);
			//addChild(ramtitlefield);
			addChild(textcontainerram);
			addChild(gfxpricefield);
			//addChild(gfxtitlefield);
			addChild(textcontainergfx);
			addChild(psupricefield);
			//addChild(psutitlefield);
			addChild(textcontainerpsu);
			addChild(totalpricefield);
			
			
			var motherboardlabel:TextField = new TextField();
			txtFormat.size = 14;
			txtFormat.color = 0x999999;
			motherboardlabel.defaultTextFormat = txtFormat;
			motherboardlabel.autoSize = TextFieldAutoSize.RIGHT;
			motherboardlabel.text = "motherboard";
			motherboardlabel.text = motherboardlabel.text.toUpperCase();
			motherboardlabel.x = 750;
			motherboardlabel.y = 30;
			addChild(motherboardlabel);
			
			var caselabel:TextField = new TextField();
			caselabel.defaultTextFormat = txtFormat;
			caselabel.autoSize = TextFieldAutoSize.RIGHT;
			caselabel.text = "case";
			caselabel.text = caselabel.text.toUpperCase();
			caselabel.x = motherboardlabel.x + 75;
			caselabel.y = motherboardlabel.y + 85;
			addChild(caselabel);
			
			var cpulabel:TextField = new TextField();
			cpulabel.defaultTextFormat = txtFormat;
			cpulabel.autoSize = TextFieldAutoSize.RIGHT;
			cpulabel.text = "processor";
			cpulabel.text = cpulabel.text.toUpperCase();
			cpulabel.x = motherboardlabel.x + 20;
			cpulabel.y = caselabel.y + 80;
			addChild(cpulabel);
			
			var hddlabel:TextField = new TextField();
			hddlabel.defaultTextFormat = txtFormat;
			hddlabel.autoSize = TextFieldAutoSize.RIGHT;
			hddlabel.text = "hard drive";
			hddlabel.text = hddlabel.text.toUpperCase();
			hddlabel.x = motherboardlabel.x + 30;
			hddlabel.y = cpulabel.y + 80;
			addChild(hddlabel);
			
			var ramlabel:TextField = new TextField();
			ramlabel.defaultTextFormat = txtFormat;
			ramlabel.autoSize = TextFieldAutoSize.RIGHT;
			ramlabel.text = "RAM";
			ramlabel.text = ramlabel.text.toUpperCase();
			ramlabel.x = motherboardlabel.x + 85;
			ramlabel.y = hddlabel.y + 85;
			addChild(ramlabel);
			
			var gfxlabel:TextField = new TextField();
			gfxlabel.defaultTextFormat = txtFormat;
			gfxlabel.autoSize = TextFieldAutoSize.RIGHT;
			gfxlabel.text = "graphics card";
			gfxlabel.text = gfxlabel.text.toUpperCase();
			gfxlabel.x = motherboardlabel.x;
			gfxlabel.y = ramlabel.y + 80;
			addChild(gfxlabel);
			
			var psulabel:TextField = new TextField();
			psulabel.defaultTextFormat = txtFormat;
			psulabel.autoSize = TextFieldAutoSize.RIGHT;
			psulabel.text = "power supply";
			psulabel.text = psulabel.text.toUpperCase();
			psulabel.x = motherboardlabel.x;
			psulabel.y = gfxlabel.y + 85;
			addChild(psulabel);
			
			
			

			var motherboardimagefield:MovieClip = new MovieClip();
			var motherboardimageloader:Loader = new Loader();
			var caseimagefield:MovieClip = new MovieClip();
			var caseimageloader:Loader = new Loader();
			var cpuimagefield:MovieClip = new MovieClip();
			var cpuimageloader:Loader = new Loader();
			var hddimagefield:MovieClip = new MovieClip();
			var hddimageloader:Loader = new Loader();
			var ramimagefield:MovieClip = new MovieClip();
			var ramimageloader:Loader = new Loader();
			var gfximagefield:MovieClip = new MovieClip();
			var gfximageloader:Loader = new Loader();
			var psuimagefield:MovieClip = new MovieClip();
			var psuimageloader:Loader = new Loader();


			var motherboardrefreshbtn:NextBtn = new NextBtn();
			motherboardrefreshbtn.x = 980;
			motherboardrefreshbtn.y = 30;
			addChild(motherboardrefreshbtn);
			motherboardrefreshbtn.addEventListener(MouseEvent.MOUSE_DOWN, forwardmotherboard);

			var motherboardrefreshbtn2:PreviousBtn = new PreviousBtn();
			motherboardrefreshbtn2.x = 880;
			motherboardrefreshbtn2.y = 30;
			addChild(motherboardrefreshbtn2);
			motherboardrefreshbtn2.addEventListener(MouseEvent.MOUSE_DOWN, previousmotherboard);


			var caserefreshbtn:NextBtn = new NextBtn();
			caserefreshbtn.x = motherboardrefreshbtn.x;
			caserefreshbtn.y = motherboardrefreshbtn.y + 82;
			addChild(caserefreshbtn);
			caserefreshbtn.addEventListener(MouseEvent.MOUSE_DOWN, forwardcase);

			var caserefreshbtn2:PreviousBtn = new PreviousBtn();
			caserefreshbtn2.x = 880;
			caserefreshbtn2.y = motherboardrefreshbtn2.y + 82;
			addChild(caserefreshbtn2);
			caserefreshbtn2.addEventListener(MouseEvent.MOUSE_DOWN, previouscase);


			var cpurefreshbtn:NextBtn = new NextBtn();
			cpurefreshbtn.x = caserefreshbtn.x;
			cpurefreshbtn.y = caserefreshbtn.y + 82;
			addChild(cpurefreshbtn);
			cpurefreshbtn.addEventListener(MouseEvent.MOUSE_DOWN, forwardcpu);

			var cpurefreshbtn2:PreviousBtn = new PreviousBtn();
			cpurefreshbtn2.x = caserefreshbtn2.x;
			cpurefreshbtn2.y = caserefreshbtn2.y + 82;
			addChild(cpurefreshbtn2);
			cpurefreshbtn2.addEventListener(MouseEvent.MOUSE_DOWN, previouscpu);



			var hddrefreshbtn:NextBtn = new NextBtn();
			hddrefreshbtn.x = cpurefreshbtn.x;
			hddrefreshbtn.y = cpurefreshbtn.y + 82;
			addChild(hddrefreshbtn);
			hddrefreshbtn.addEventListener(MouseEvent.MOUSE_DOWN, forwardhdd);

			var hddrefreshbtn2:PreviousBtn = new PreviousBtn();
			hddrefreshbtn2.x = cpurefreshbtn2.x;
			hddrefreshbtn2.y = cpurefreshbtn.y + 82;
			addChild(hddrefreshbtn2);
			hddrefreshbtn2.addEventListener(MouseEvent.MOUSE_DOWN, previoushdd);



			var ramrefreshbtn:NextBtn = new NextBtn();
			ramrefreshbtn.x = hddrefreshbtn.x;
			ramrefreshbtn.y = hddrefreshbtn.y + 82;
			addChild(ramrefreshbtn);
			ramrefreshbtn.addEventListener(MouseEvent.MOUSE_DOWN, forwardram);

			var ramrefreshbtn2:PreviousBtn = new PreviousBtn();
			ramrefreshbtn2.x = hddrefreshbtn2.x;
			ramrefreshbtn2.y = hddrefreshbtn2.y + 82;
			addChild(ramrefreshbtn2);
			ramrefreshbtn2.addEventListener(MouseEvent.MOUSE_DOWN, previousram);


			var gfxrefreshbtn:NextBtn = new NextBtn();
			gfxrefreshbtn.x = ramrefreshbtn.x;
			gfxrefreshbtn.y = ramrefreshbtn.y + 82;
			addChild(gfxrefreshbtn);
			gfxrefreshbtn.addEventListener(MouseEvent.MOUSE_DOWN, forwardgfx);

			var gfxrefreshbtn2:PreviousBtn = new PreviousBtn();
			gfxrefreshbtn2.x = ramrefreshbtn2.x;
			gfxrefreshbtn2.y = ramrefreshbtn2.y + 82;
			addChild(gfxrefreshbtn2);
			gfxrefreshbtn2.addEventListener(MouseEvent.MOUSE_DOWN, previousgfx);



			var psurefreshbtn:NextBtn = new NextBtn();
			psurefreshbtn.x = gfxrefreshbtn.x;
			psurefreshbtn.y = gfxrefreshbtn.y + 82;
			addChild(psurefreshbtn);
			psurefreshbtn.addEventListener(MouseEvent.MOUSE_DOWN, forwardpsu);

			var psurefreshbtn2:PreviousBtn = new PreviousBtn();
			psurefreshbtn2.x = gfxrefreshbtn2.x;
			psurefreshbtn2.y = gfxrefreshbtn2.y + 82;
			addChild(psurefreshbtn2);
			psurefreshbtn2.addEventListener(MouseEvent.MOUSE_DOWN, previouspsu);


			function getmotherboard()
			{
				getpart("motherboard%201150", 430512031, mbmin, mbmax, motherboarditem);
			}
			function getcase()
			{
				getpart("case", 430498031, casemin, casemax, caseitem);
			}
			function getcpu()
			{
				getpart("processor%201150", 430515031, cpumin, cpumax, cpuitem);
			}
			function gethdd()
			{
				getpart("sata%20desktop", 430502031, hddmin, hddmax, hdditem);
			}
			function getram()
			{
				getpart("ddr3%20desktop", 430511031, rammin, rammax, ramitem);
			}
			function getgfx()
			{
				getpart("pci-e", 430500031, gfxmin, gfxmax, gfxitem);
			}
			function getpsu()
			{
				getpart("power%20supply%20desktop", 430514031, psumin, psumax, psuitem);
			}

			function forwardmotherboard()
			{
				if (motherboarditem != motherboard.totalitems-1)
				{
					motherboarditem +=  1;
				}
				else
				{
					motherboarditem = 0;
				}
				getpart("motherboard%201150", 430512031, mbmin, mbmax, motherboarditem);
				setTimeout(gettotal, 50);
			}

			function previousmotherboard()
			{
				if (motherboarditem != 0)
				{
					motherboarditem -=  1;
				}
				else
				{
					motherboarditem = motherboard.totalitems - 1;
				}
				getpart("motherboard%201150", 430512031, mbmin, mbmax, motherboarditem);
				setTimeout(gettotal, 50);
			}



			function forwardcase()
			{
				if (caseitem != cases.totalitems-1)
				{
					caseitem +=  1;
				}
				else
				{
					caseitem = 0;
				}
				getpart("case", 430498031, casemin, casemax, caseitem);
				setTimeout(gettotal, 50);
			}

			function previouscase()
			{
				if (caseitem != 0)
				{
					caseitem -=  1;
				}
				else
				{
					caseitem = cases.totalitems - 1;
				}
				getpart("case", 430498031, casemin, casemax, caseitem);
				setTimeout(gettotal, 50);
			}



			function forwardcpu()
			{
				if (cpuitem != cpu.totalitems-1)
				{
					cpuitem +=  1;
				}
				else
				{
					cpuitem = 0;
				}
				getpart("processor%201150", 430515031, cpumin, cpumax, cpuitem);
				setTimeout(gettotal, 50);
			}

			function previouscpu()
			{
				if (cpuitem != 0)
				{
					cpuitem -=  1;
				}
				else
				{
					cpuitem = cpu.totalitems - 1;
				}
				getpart("processor%201150", 430515031, cpumin, cpumax, cpuitem);
				setTimeout(gettotal, 50);
			}


			function forwardhdd()
			{
				if (hdditem != hdd.totalitems-1)
				{
					hdditem +=  1;
				}
				else
				{
					hdditem = 0;
				}
				getpart("sata%20desktop", 430502031, hddmin, hddmax, hdditem);
				setTimeout(gettotal, 50);
			}

			function previoushdd()
			{
				if (hdditem != 0)
				{
					hdditem -=  1;
				}
				else
				{
					hdditem = hdd.totalitems - 1;
				}
				getpart("sata%20desktop", 430502031, hddmin, hddmax, hdditem);
				setTimeout(gettotal, 50);
			}




			function forwardram()
			{
				if (ramitem != ram.totalitems-1)
				{
					ramitem +=  1;
				}
				else
				{
					ramitem = 0;
				}
				getpart("ddr3%20desktop", 430511031, rammin, rammax, ramitem);
				setTimeout(gettotal, 50);
			}

			function previousram()
			{
				if (ramitem != 0)
				{
					ramitem -=  1;
				}
				else
				{
					ramitem = ram.totalitems - 1;
				}
				getpart("ddr3%20desktop", 430511031, rammin, rammax, ramitem);
				setTimeout(gettotal, 50);
			}




			function forwardgfx()
			{
				if (gfxitem != gfx.totalitems-1)
				{
					gfxitem +=  1;
				}
				else
				{
					gfxitem = 0;
				}
				getpart("pci-e", 430500031, gfxmin, gfxmax, gfxitem);
				trace(escape("pci-e"));
				setTimeout(gettotal, 50);
			}

			function previousgfx()
			{
				if (gfxitem != 0)
				{
					gfxitem -=  1;
				}
				else
				{
					gfxitem = gfx.totalitems - 1;
				}
				getpart("pci-e", 430500031, gfxmin, gfxmax, gfxitem);
				setTimeout(gettotal, 50);
			}


			function forwardpsu()
			{
				if (psuitem != psu.totalitems-1)
				{
					psuitem +=  1;
				}
				else
				{
					psuitem = 0;
				}
				getpart("power%20supply%20desktop", 430514031, psumin, psumax, psuitem);
				setTimeout(gettotal, 50);
			}

			function previouspsu()
			{
				if (psuitem != 0)
				{
					psuitem -=  1;
				}
				else
				{
					psuitem = psu.totalitems - 1;
				}
				getpart("power%20supply%20desktop", 430514031, psumin, psumax, psuitem);
				setTimeout(gettotal, 50);
			}


			function gettotal():void
			{
				var thetotal:Number = (motherboardprice + caseprice + cpuprice + hddprice + ramprice + gfxprice + psuprice);
				thetotal = Math.round(thetotal*100)/100;
				if (isNaN(thetotal))
				{
					totalpricefield.text = "Sorry, an Item is missing its price therefore the total cannot be shown, please reselect the item";
				}
				else
				{
					totalpricefield.text = "£" + thetotal.toString() + " - Total";
				}
			}

			setTimeout(getmotherboard, 50);
			setTimeout(getcase, 100);
			setTimeout(getcpu, 150);
			setTimeout(gethdd, 200);
			setTimeout(getram, 250);
			setTimeout(getgfx, 300);
			setTimeout(getpsu, 350);
			setTimeout(gettotal, 10500);



			//trace(motherboard.price + cases.price + cpu.price + hdd.price + ram.price + gfx.price + psu.price)
			function getpart(part:String, node:int, min:int, max:int, itemno:Number):void
			{

				var request:URLRequest = new URLRequest("http://dyi-pc.net16.net/soap/indexpost.php?search=" + part + "&min=" + min + "&max=" + max + "&node=" + node);

				var loader:URLLoader = new URLLoader();


				loader.addEventListener(Event.COMPLETE, getpartxml);


				loader.addEventListener(IOErrorEvent.IO_ERROR, handleIOError);


				loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR , handleSecurityError);


				loader.load(request);

				function handleIOError(evt:IOErrorEvent):void
				{
					trace("handleIOError(" + evt.toString());
				}

				function handleSecurityError(evt:SecurityErrorEvent):void
				{
					trace("handleSecurityError("+evt.toString());
				}

				function getpartxml(evt:Event):void
				{
					if (part == "motherboard%201150")
					{
						motherboard = new Returnxml(evt.target.data,motherboarditem);//evt.target.data
					}
					if (part == "case")
					{
						cases = new Returnxml(evt.target.data,caseitem);
					}
					if (part == "processor%201150")
					{
						cpu = new Returnxml(evt.target.data,cpuitem);
					}
					if (part == "sata%20desktop")
					{
						hdd = new Returnxml(evt.target.data,hdditem);
					}
					if (part == "ddr3%20desktop")
					{
						ram = new Returnxml(evt.target.data,ramitem);
					}
					if (part == "pci-e")
					{
						gfx = new Returnxml(evt.target.data,gfxitem);
					}
					if (part == "power%20supply%20desktop")
					{
						psu = new Returnxml(evt.target.data,psuitem);
					}
					//var evtt:Event = new Event(Event.COMPLETE);
					dispatchEvent(evt);
				}



				addEventListener(Event.COMPLETE, xmlLoadCompleted);
				function xmlLoadCompleted(e:Event):void
				{
					if (part == "motherboard%201150")
					{
						motherboardimageloader.load(new URLRequest(motherboard.imgurl));
						motherboardimagefield.addChild(motherboardimageloader);
						motherboardimagefield.y = 10;
						motherboardimagefield.x = 10;
						addChild(motherboardimagefield);
						motherboardtitlefield.text = motherboard.title;
						motherboardpricefield.text = motherboard.price;
						motherboardprice = parseFloat(motherboard.price.substr(1));
						textcontainermb.addEventListener(MouseEvent.MOUSE_UP, mymbButtonFunction);
						function mymbButtonFunction(evtmb: MouseEvent)
						{
							var motherboardrequest:URLRequest = new URLRequest(motherboard.detailpage);
							navigateToURL(motherboardrequest, "_blank");
						}
						removeEventListener(Event.COMPLETE, xmlLoadCompleted);
					}

					if (part == "case")
					{
						caseimageloader.load(new URLRequest(cases.imgurl));
						caseimagefield.x = 10;
						caseimagefield.y = 92;
						caseimagefield.addChild(caseimageloader);
						addChild(caseimagefield);
						casetitlefield.text = cases.title;
						casepricefield.text = cases.price;
						caseprice = parseFloat(cases.price.substr(1));
						textcontainercase.addEventListener(MouseEvent.MOUSE_UP, mycaseButtonFunction);
						function mycaseButtonFunction(evtcase: MouseEvent)
						{
							var casedetailrequest:URLRequest = new URLRequest(cases.detailpage);
							navigateToURL(casedetailrequest, "_blank");
						}
						removeEventListener(Event.COMPLETE, xmlLoadCompleted);
					}
					if (part == "processor%201150")
					{
						cpuimageloader.load(new URLRequest(cpu.imgurl));
						cpuimagefield.x = 10;
						cpuimagefield.y = 174;
						cpuimagefield.addChild(cpuimageloader);
						addChild(cpuimagefield);
						cputitlefield.text = cpu.title;
						cpupricefield.text = cpu.price;
						cpuprice = parseFloat(cpu.price.substr(1));
						textcontainercpu.addEventListener(MouseEvent.MOUSE_UP, mycpuButtonFunction);
						function mycpuButtonFunction(evtcase: MouseEvent)
						{
							var cpudetailrequest:URLRequest = new URLRequest(cpu.detailpage);
							navigateToURL(cpudetailrequest, "_blank");
						}
						removeEventListener(Event.COMPLETE, xmlLoadCompleted);
					}
					if (part == "sata%20desktop")
					{
						hddimageloader.load(new URLRequest(hdd.imgurl));
						hddimagefield.x = 10;
						hddimagefield.y = 256;
						hddimagefield.addChild(hddimageloader);
						addChild(hddimagefield);
						hddtitlefield.text = hdd.title;
						hddpricefield.text = hdd.price;
						hddprice = parseFloat(hdd.price.substr(1));
						textcontainerhdd.addEventListener(MouseEvent.MOUSE_UP, myhddButtonFunction);
						function myhddButtonFunction(evtcase: MouseEvent)
						{
							var hdddetailrequest:URLRequest = new URLRequest(hdd.detailpage);
							navigateToURL(hdddetailrequest, "_blank");
						}
						removeEventListener(Event.COMPLETE, xmlLoadCompleted);
					}

					if (part == "ddr3%20desktop")
					{
						ramimageloader.load(new URLRequest(ram.imgurl));
						ramimagefield.x = 10;
						ramimagefield.y = 338;
						ramimagefield.addChild(ramimageloader);
						addChild(ramimagefield);
						ramtitlefield.text = ram.title;
						rampricefield.text = ram.price;
						ramprice = parseFloat(ram.price.substr(1));
						textcontainerram.addEventListener(MouseEvent.MOUSE_UP, myramButtonFunction);
						function myramButtonFunction(evtcase: MouseEvent)
						{
							var ramdetailrequest:URLRequest = new URLRequest(ram.detailpage);
							navigateToURL(ramdetailrequest, "_blank");
						}
						removeEventListener(Event.COMPLETE, xmlLoadCompleted);
					}

					if (part == "pci-e")
					{
						gfximageloader.load(new URLRequest(gfx.imgurl));
						gfximagefield.x = 10;
						gfximagefield.y = 420;
						gfximagefield.addChild(gfximageloader);
						addChild(gfximagefield);
						gfxtitlefield.text = gfx.title;
						gfxpricefield.text = gfx.price;
						gfxprice = parseFloat(gfx.price.substr(1));
						textcontainergfx.addEventListener(MouseEvent.MOUSE_UP, mygfxButtonFunction);
						function mygfxButtonFunction(evtcase: MouseEvent)
						{
							var gfxdetailrequest:URLRequest = new URLRequest(gfx.detailpage);
							navigateToURL(gfxdetailrequest, "_blank");
						}
						removeEventListener(Event.COMPLETE, xmlLoadCompleted);
					}
					if (part == "power%20supply%20desktop")
					{
						psuimageloader.load(new URLRequest(psu.imgurl));
						psuimagefield.x = 10;
						psuimagefield.y = 502;
						psuimagefield.addChild(psuimageloader);
						addChild(psuimagefield);
						psutitlefield.text = psu.title;
						psupricefield.text = psu.price;
						psuprice = parseFloat(psu.price.substr(1));
						textcontainerpsu.addEventListener(MouseEvent.MOUSE_UP, mypsuButtonFunction);
						function mypsuButtonFunction(evtcase: MouseEvent)
						{
							var psudetailrequest:URLRequest = new URLRequest(psu.detailpage);
							navigateToURL(psudetailrequest, "_blank");
						}
						removeEventListener(Event.COMPLETE, xmlLoadCompleted);
					}

				}
			}

		}


		public function getminmaxforusablityandbudget(budget:int, usability:String)
		{
			if (usability == "gaming")
			{
				gfxmin = ((budget-100)/highDivis)*100;
				cpumin = (budget / medDivis) * 100;
				rammin = ((budget-80)/medDivis)*100;
				psumin = ((budget-50)/medDivis)*100;
				casemin = ((budget-40)/medDivis)*100;
				hddmin = ((budget-60)/lowDivis)*100;
				mbmin = ((budget-500)/medDivis)*100;

				gfxmax = ((budget+50/highDivis))*100;
				cpumax = ((budget+900)/medDivis)*100;
				rammax = (budget / medDivis) * 100;
				psumax = ((budget+20)/medDivis)*100;
				casemax = ((budget+15)/medDivis)*100;
				hddmax = ((budget+5)/lowDivis)*100;
				mbmax = ((budget+100)/medDivis)*100;
			}

			if (usability == "productivity")
			{
				gfxmin = ((budget-100)/lowDivis)*100;
				cpumin = ((budget-20)/highDivis)*100;
				rammin = ((budget-80)/medDivis)*100;
				psumin = ((budget-50)/lowDivis)*100;
				casemin = ((budget-40)/lowDivis)*100;
				hddmin = ((budget-100)/highDivis)*100;
				mbmin = ((budget-150)/highDivis)*100;

				gfxmax = ((budget/lowDivis))*100;
				cpumax = ((budget+100)/highDivis)*100;
				rammax = (budget / medDivis) * 100;
				psumax = ((budget+20)/lowDivis)*100;
				casemax = ((budget+15)/lowDivis)*100;
				hddmax = ((budget-50)/highDivis)*100;
				mbmax = ((budget-50)/highDivis)*100;
			}

			if (usability == "web browsing")
			{
				gfxmin = ((budget)/lowDivis)*100;
				cpumin = ((budget)/lowDivis)*100;
				rammin = ((budget)/lowDivis)*100;
				psumin = ((budget)/lowDivis)*100;
				casemin = ((budget)/lowDivis)*100;
				hddmin = ((budget)/lowDivis)*100;
				mbmin = ((budget-100)/lowDivis)*100;

				gfxmax = ((budget+100)/lowDivis)*100;
				cpumax = ((budget+800)/lowDivis)*100;
				rammax = ((budget+100)/lowDivis)*100;
				psumax = ((budget+100)/lowDivis)*100;
				casemax = ((budget+100)/lowDivis)*100;
				hddmax = ((budget+100)/lowDivis)*100;
				mbmax = ((budget+300)/lowDivis)*100;
			}

			if (usability == "3d modelling")
			{
				gfxmin = ((budget-100)/highDivis)*100;
				cpumin = ((budget-50)/highDivis)*100;
				rammin = ((budget-400)/highDivis)*100;
				psumin = ((budget-150)/medDivis)*100;
				casemin = ((budget-100)/medDivis)*100;
				hddmin = ((budget-100)/highDivis)*100;
				mbmin = ((budget-150)/medDivis)*100;

				gfxmax = ((budget/highDivis))*100;
				cpumax = (budget / highDivis) * 100;
				rammax = ((budget-200)/highDivis)*100;
				psumax = ((budget+100)/medDivis)*100;
				casemax = ((budget)/medDivis)*100;
				hddmax = ((budget-50)/highDivis)*100;
				mbmax = ((budget-50)/medDivis)*100;
			}

		}

	}

}