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

/**
* iframe高度处理
* @author zxub 2006-09-29
**/

/**
* 设置iframe高度等于内部页面高度，用于内部页面
*/
function setParentHeight(_iframeId)
{
	if(parent.setIFrameHeight) return;
	if(window.addEventListener)//firefox
	{
		var _action=function()
		{
			var _iframe=parent.document.getElementById(_iframeId);
			if(!_iframe) return;
			_iframe.style.height=_iframe.contentDocument.body.offsetHeight+16;
		}
		window.addEventListener("load", _action, false);
	}
	else if(window.attachEvent)//IE
	{
		var _action=function()
		{
			if(!parent.document.getElementById(_iframeId)) return;
			parent.document.getElementById(_iframeId).style.height=document.body.scrollHeight;
		}
		window.attachEvent("onload", _action);
	}
}

/**
* 设置iframe高度等于内部页面高度，用于父级页面
**/
function setIFrameHeight(_iframeId)
{
	if(window.addEventListener)//firefox
	{
		var _action=function()
		{
			var _iframe=document.getElementById(_iframeId);
			if(!_iframe) return;
			_iframe.style.height=_iframe.contentDocument.body.scrollHeight;
			_iframe.onload=function()
			{
				this.style.height=this.contentDocument.body.offsetHeight+16;
			}
		}
		window.addEventListener("load", _action, false);
	}
	else if(window.attachEvent)//IE
	{
		var _action=function()
		{
			if(!document.getElementById(_iframeId)) return;
			document.getElementById(_iframeId).style.height=document.frames[_iframeId].document.body.scrollHeight;
			document.getElementById(_iframeId).onreadystatechange=function()
			{
				if(this.readyState=="complete")
				{
					this.style.height=document.frames[_iframeId].document.body.scrollHeight;
				}
			}
		}
		window.attachEvent("onload", _action);
	}
}

}
/*
     FILE ARCHIVED ON 20:33:01 Jul 10, 2011 AND RETRIEVED FROM THE
     INTERNET ARCHIVE ON 22:59:18 Jul 12, 2025.
     JAVASCRIPT APPENDED BY WAYBACK MACHINE, COPYRIGHT INTERNET ARCHIVE.

     ALL OTHER CONTENT MAY ALSO BE PROTECTED BY COPYRIGHT (17 U.S.C.
     SECTION 108(a)(3)).
*/
/*
playback timings (ms):
  captures_list: 0.53
  exclusion.robots: 0.019
  exclusion.robots.policy: 0.009
  esindex: 0.011
  cdx.remote: 24.88
  LoadShardBlock: 64.251 (3)
  PetaboxLoader3.datanode: 77.355 (4)
  load_resource: 215.092
  PetaboxLoader3.resolve: 184.941
*/