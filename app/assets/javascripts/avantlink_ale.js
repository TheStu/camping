var ready;ready=function(){function a(){for(var a=document.getElementsByTagName("a"),b="",c=0,g=0;g<a.length;g++){var h=a[g],i=h.href.split("?");if(i[0]=i[0].toLowerCase(),c=0,0==i[0].indexOf("http")){var j=i[0].indexOf("://");if(j>0)for(var k=i[0].substring(j+3).split("/"),l=k[0],m=0;m<d.length;m++)if(0==l.indexOf(d[m])||l.indexOf("."+d[m])>0){if(c=1,10048==e[m]||11177==e[m])for(var n=0;n<f.length;n++)if(i[0].indexOf(f[n])>=0){c=0;break}if(1==c)try{b=h.innerHTML,h.href="http://www.avantlink.com/click.php?tt=ale&ti=3481&pri=0&pw=41369&mi="+e[m]+"&url="+encodeURIComponent(h.href),h.innerHTML=b,h.rel="nofollow"}catch(a){}break}}}}function b(){a()}function c(a,b){function c(){/KHTML|WebKit/i.test(navigator.userAgent)?h=!0:k.addEventListener?g=!0:i=!0}function d(){e||(e=!0,b.clearInterval(j),j=null,a())}var e=!1,f=!1,g=!1,h=!1,i=!1,j=null,k=null;if("function"==typeof a)if("undefined"==typeof b?(b=window,k=window.document):k=b.document,c(),g)k.addEventListener("DOMContentLoaded",d,null);else if(f){var l="src='javascript:void(0)'";"https:"==k.location.protocol&&(l="src=//0"),k.write("<script id='DOMLoadScript' defer "+l+"></script>");var m=k.getElementById("DOMLoadScript"),n=m.onreadystatechange;m.onreadystatechange=function(){"function"==typeof n&&n(),"complete"==m.readyState&&(m.onreadystatechange=null,m.removeNode(!0),d())}}else{if(h)return void(j=b.setInterval(function(){/loaded|complete/.test(k.readyState)&&d()},10));b.onload=d}}var d=new Array("www.appoutdoors","www.avantlink","www.backcountry","www.campsaver","www.coloradokayak","www.cyclocamping","www.ems","www.fontanasports","www.hyperlitemountaingear","www.klymit","www.leftlanesports","www.masseysoutfitters","www.mountaingear","www.omcgear","www.outdoorcooking","www.patagonia","www.ramseyoutdoor","rei.com","www.rockcreek","www.rockymountaintrail","www.sierratradingpost","www.skis","www.snowboards","www.summithut","www.summitonline","www.ula-equipment","www.underarmour"),e=new Array("10260","10048","10060","10008","11569","10765","10785","10469","13582","11957","10965","10071","11419","10068","10075","10083","10263","10248","10049","10869","10921","10279","10345","10593","10280","10881","11707"),f=new Array("avantlink.com/click.php","avantlink.com/gbi/","avantlink.com/tpv/","avantlink.com/ptc","avantlink.com/syndicate","avantlink.com/coupons","avantlink.com/product_display","avantlink.com/product_showcase","avantlink.ca/click.php","avantlink.ca/gbi/","avantlink.ca/tpv/","avantlink.ca/ptc","avantlink.ca/syndicate","avantlink.ca/coupons","avantlink.ca/product_display","avantlink.ca/product_showcase","avantlink.com.au/click.php","avantlink.com.au/gbi/","avantlink.com.au/tpv/","avantlink.com.au/ptc","avantlink.com.au/syndicate","avantlink.com.au/coupons","avantlink.com.au/product_display","avantlink.com.au/product_showcase");c(b)},$(document).ready(ready),$(document).on("page:load",ready);