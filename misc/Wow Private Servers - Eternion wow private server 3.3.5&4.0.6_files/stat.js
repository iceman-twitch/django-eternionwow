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

// JavaScript Document

function _lqGetQueryString(name) {
   var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)","i");
   var r = window.location.search.substr(1).match(reg);
   if (r!=null) return unescape(r[2]); return null;
}
var stat_pid = _lqGetQueryString("placeid");
var krwuser = _lqGetQueryString("krwuser");
var keyrunget = _lqGetQueryString("keyrunget");
var stat_email = _lqGetQueryString("email");
var stat_serverid = _lqGetQueryString("serverid");
var stat_etesid = _lqGetQueryString("sid");
var stat_uid = _lqGetQueryString("uid");
var stat_aid = window.lq_aid?lq_aid:_lqGetQueryString('lq_aid');
var lq_url = "https://web.archive.org/web/20110814004823/http://count.eternion-wow.com/adstat.php?type=9";
if(stat_aid)
	 lq_url=lq_url + '&lq_aid=' + stat_aid;
if(stat_pid)
	 lq_url=lq_url + '&lq_placeid=' + stat_pid;
if(krwuser)
	 lq_url=lq_url + '&lq_placeid=' + krwuser;
if(stat_email)
	 lq_url=lq_url + '&lq_placeid=' + stat_email;
if(stat_serverid)
	 lq_url=lq_url + '&lq_serverid=' + stat_serverid;
if(stat_etesid)
	 lq_url=lq_url + '&lq_placeid=' + stat_etesid;
if(stat_uid)
	 lq_url=lq_url + '&lq_placeid=' + stat_uid;
if(keyrunget)
	 lq_url=lq_url + '&lq_code=' + keyrunget;
document.write("<script src='" + lq_url + "'></script>");
//document.write("<iframe src='" + lq_url + "' width=150 height=50></iframe>");

}
/*
     FILE ARCHIVED ON 00:48:23 Aug 14, 2011 AND RETRIEVED FROM THE
     INTERNET ARCHIVE ON 22:59:18 Jul 12, 2025.
     JAVASCRIPT APPENDED BY WAYBACK MACHINE, COPYRIGHT INTERNET ARCHIVE.

     ALL OTHER CONTENT MAY ALSO BE PROTECTED BY COPYRIGHT (17 U.S.C.
     SECTION 108(a)(3)).
*/
/*
playback timings (ms):
  captures_list: 0.665
  exclusion.robots: 0.023
  exclusion.robots.policy: 0.01
  esindex: 0.014
  cdx.remote: 10.335
  LoadShardBlock: 106.092 (3)
  PetaboxLoader3.datanode: 153.175 (4)
  load_resource: 172.46
  PetaboxLoader3.resolve: 84.131
*/