package DIY
{

	import flash.events.Event;

	public class Returnxml
	{
		public var title;
		public var imgurl;
		public var detailpage;
		public var price;
		public var totalitems:int;
		public function Returnxml(response:String, itemno:Number)
		{
			var xmlData:XML;

			try
			{
				xmlData = new XML(response);
				title = xmlData.Item[itemno].title;
				imgurl = xmlData.Item[itemno].image;
				detailpage = xmlData.Item[itemno].detailpage;
				price = xmlData.Item[itemno].price;
				totalitems = xmlData.children().length();
			}
			catch (error:TypeError)
			{
				trace("The response data was not in a valid XML format");
			}

			trace(totalitems);
		}

	}

}
