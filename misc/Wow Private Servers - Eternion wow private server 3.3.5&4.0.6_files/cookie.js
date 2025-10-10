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

// utility function to retrieve an expiration date in proper

// format; pass three integer parameters for the number of days, hours,

// and minutes from now you want the cookie to expire (or negative

// values for a past date); all three parameters are required,

// so use zeros where appropriate

function getExpDate(days, hours, minutes) {

    var expDate = new Date( );

    if (typeof days == "number" && typeof hours == "number" && 

        typeof hours == "number") {

        expDate.setDate(expDate.getDate( ) + parseInt(days));

        expDate.setHours(expDate.getHours( ) + parseInt(hours));

        expDate.setMinutes(expDate.getMinutes( ) + parseInt(minutes));

        return expDate.toGMTString( );

    }

}

   

// utility function called by getCookie( )

function getCookieVal(offset) {

    var endstr = document.cookie.indexOf (";", offset);

    if (endstr == -1) {

        endstr = document.cookie.length;

    }

    return unescape(document.cookie.substring(offset, endstr));

}

   

// primary function to retrieve cookie by name

function getCookie(name) {

    var arg = name + "=";

    var alen = arg.length;

    var clen = document.cookie.length;

    var i = 0;

    while (i < clen) {

        var j = i + alen;

        if (document.cookie.substring(i, j) == arg) {

            return getCookieVal(j);

        }

        i = document.cookie.indexOf(" ", i) + 1;

        if (i == 0) break; 

    }

    return "";

}

   

// store cookie value with optional details as needed

function setCookie(name, value, expires, path, domain, secure) {

    document.cookie = name + "=" + escape (value) +

        ((expires) ? "; expires=" + expires : "") +

        ((path) ? "; path=" + path : "") +

        ((domain) ? "; domain=" + domain : "") +

        ((secure) ? "; secure" : "");

}

   

// remove the cookie by setting ancient expiration date

function deleteCookie(name,path,domain) {

    if (getCookie(name)) {

        document.cookie = name + "=" +

            ((path) ? "; path=" + path : "") +

            ((domain) ? "; domain=" + domain : "") +

            "; expires=Thu, 01-Jan-70 00:00:01 GMT";

    }

}

}
/*
     FILE ARCHIVED ON 20:33:26 Jul 10, 2011 AND RETRIEVED FROM THE
     INTERNET ARCHIVE ON 22:59:18 Jul 12, 2025.
     JAVASCRIPT APPENDED BY WAYBACK MACHINE, COPYRIGHT INTERNET ARCHIVE.

     ALL OTHER CONTENT MAY ALSO BE PROTECTED BY COPYRIGHT (17 U.S.C.
     SECTION 108(a)(3)).
*/
/*
playback timings (ms):
  captures_list: 0.478
  exclusion.robots: 0.016
  exclusion.robots.policy: 0.007
  esindex: 0.01
  cdx.remote: 7.429
  LoadShardBlock: 95.305 (3)
  PetaboxLoader3.datanode: 94.435 (4)
  load_resource: 93.765
  PetaboxLoader3.resolve: 62.66
*/