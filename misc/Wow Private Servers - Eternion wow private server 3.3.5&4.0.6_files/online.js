var _____WB$wombat$assign$function_____ = function(name) {return (self._wb_wombat && self._wb_wombat.local_init && self._wb_wombat.local_init(name)) || self[name]; };
if (!self.__WB_pmw) { self.__WB_pmw = function(obj) { this.__WB_source = obj; return this; } }
{
  let window = _____WB$wombat$assign$function_____("window");
  let self = _____WB$wombat$assign$function_____("self");
  let document = _____WB$wombat$assign$function_____("document");
  let location = _____WB$wombat$assign$function_____("location");
  let top = _____WB$wombat$assign$function_____("top");
  let parent = _____WB$wombat$assign$function_____("parent");
  let frames = _____WB$wombat$assign$function_____("frames");
  let opener = _____WB$wombat$assign$function_____("opener");

var xmlHttp=null;
var objHTML;
var index = 0;
var total = 5;
var arr = new Array();
var arrnum = new Array();
for (i = 0; i < total; i ++)
	arrnum[i] = 0;
arr[0] = "Apocalypse_Fun_Realm";;
arr[1] = "eternion_ins";
arr[2] = "Deathwing";
arr[3] = "Hellscream";
arr[4] = "Lostcity";

function GetXmlHttpObject()
{
	try
	{
		// Firefox, Opera 8.0+, Safari
		xmlHttp=new XMLHttpRequest();
	}
	catch (e)
	{
		// Internet Explorer
		try
		{
			xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch (e)
		{
			xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	return xmlHttp;
}
function ChangeCont()
{
	if(xmlHttp.readyState==4)
	{
		document.getElementById("content" + index).innerHTML = xmlHttp.responseText;
		str = document.getElementById("content" + index).innerText;
		if (navigator.appName == "Microsoft Internet Explorer") {
			if (str.indexOf("images/Wrath-Logo-Small.png") == -1)
			{
				str = str.replace(/[\w]+ : (\d+) \/ [\w]+/g, "$1");
				arrnum[index] = parseInt(str);
				total_number = 0;
				for (i = 0; i < total; i ++)
					total_number += arrnum[i];
				document.getElementById("total").innerHTML = "Total Player Online: " + total_number;
			}
		}
		index ++;
		if (index >= total)
		{
			setTimeout("OutPut()",100000);
			index = 0;
		}
		else
			OutPut();
	}
}
function ReadOnNum()
{
	xmlHttp = GetXmlHttpObject();
	var today = new Date(); 
	var url;
	url="online.php";
	
	url+="?id="+arr[index];
	url+="&sn="+today.getTime();
	xmlHttp.onreadystatechange=ChangeCont;
	xmlHttp.open("GET",url,true);
	xmlHttp.send(null);
}

function OutPut()
{
	ReadOnNum();
}

}
/*
     FILE ARCHIVED ON 20:31:44 Jul 10, 2011 AND RETRIEVED FROM THE
     INTERNET ARCHIVE ON 22:59:18 Jul 12, 2025.
     JAVASCRIPT APPENDED BY WAYBACK MACHINE, COPYRIGHT INTERNET ARCHIVE.

     ALL OTHER CONTENT MAY ALSO BE PROTECTED BY COPYRIGHT (17 U.S.C.
     SECTION 108(a)(3)).
*/
/*
playback timings (ms):
  captures_list: 0.731
  exclusion.robots: 0.025
  exclusion.robots.policy: 0.011
  esindex: 0.014
  cdx.remote: 60.683
  LoadShardBlock: 85.638 (3)
  PetaboxLoader3.datanode: 172.899 (4)
  load_resource: 168.495
  PetaboxLoader3.resolve: 45.264
*/