//Items
package autoevony.common 
{
    import com.umge.sovt.eum.*;
    import flash.xml.*;
    
    public class Items extends Object
    {
        public function Items()
        {
            super();
            return;
        }

        public static function getItemId(arg1:String):String
        {
            var loc1:*=null;
            if (externalItemNames == null) 
            {
                initExternalItemNames();
            }
            var loc2:*=0;
            var loc3:*=externalItemNames;
            for (loc1 in loc3) 
            {
                if (externalItemNames[loc1].toLowerCase() != arg1.toLowerCase()) 
                {
                    continue;
                }
                return loc1;
            }
            return null;
        }

        internal static function initExternalItemNames():void
        {
            var loc3:*=null;
            var loc4:*=null;
            var loc1:*=dataXML.getXMLDoc("ItemEumDefine");
            var loc2:*=new Array();
            externalItemNames = new Array();
            var loc5:*=0;
            var loc6:*=loc1.firstChild.nextSibling.childNodes;
            for each (loc3 in loc6) 
            {
                if (loc3.attributes.id == undefined || loc3.attributes.name == undefined) 
                {
                    continue;
                }
                loc4 = (loc4 = autoevony.common.Utils.trim(loc3.attributes.name)).split(" ").join("_");
                if (loc2[loc4] != undefined) 
                {
                    var loc7:*;
                    var loc8:*;
                    var loc9:*=((loc7 = loc2)[loc8 = loc4] + 1);
                    loc7[loc8] = loc9;
                    loc4 = loc4 + loc2[loc4];
                }
                else 
                {
                    loc2[loc4] = 0;
                }
                externalItemNames[autoevony.common.Utils.trim(loc3.attributes.id)] = loc4;
            }
            return;
        }

        public static function getItemName(arg1:String):String
        {
            if (externalItemNames == null) 
            {
                initExternalItemNames();
            }
            if (externalItemNames[arg1] == undefined) 
            {
                return arg1;
            }
            return externalItemNames[arg1];
        }

        
        {
            dataXML = new com.umge.sovt.eum.GetDataXML();
            externalItemNames = null;
        }

        internal static var externalItemNames:Array=null;

        internal static var dataXML:com.umge.sovt.eum.GetDataXML;
    }
}


