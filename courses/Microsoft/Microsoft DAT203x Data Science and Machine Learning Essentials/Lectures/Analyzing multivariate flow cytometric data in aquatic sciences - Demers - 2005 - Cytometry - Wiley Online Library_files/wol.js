if(!$("html").hasClass("js_en")){$("html").addClass("js_en")
}var proxied=((location.hostname.indexOf("onlinelibrary.wiley.com")!=-1)&&(location.hostname.substring(location.hostname.indexOf("onlinelibrary.wiley.com")+23)==""))?false:true;
var wol=this.wol||{};
$(function(){$.ol={};
$(".publicationTypes #allTypes,.subjectsAndAccess #allTopics, #allAsist").searchSelectAll();
$(document).globalMessaging();
wol.rightsLink.init();
if($("#accordion").length>0){$("#accordion").accordion({header:"h2"})
}$(".contextTrigger").contextFilter();
$("#additionalInformation").slider();
$("#login #loggedIn .profile>li").profileMenu();
$("#issueTocGroups, #titles, #publications, .articles, .books, .contentAlerts").selectAll();
$(".emrw-table").mrwTables();
$(".jumpList").jumpList();
$("#loginEmail, #loginPassword").loginLabels();
if($("#pdf").length){$(window).resize(function(){$("#pdf").children("iframe").height(($(window).height()-$("#pdfHeader").height())-2)
});
$(window).triggerHandler("resize")
}if(!$("#mailUpdates").attr("checked")){$("#mailUpdates").parents("fieldset").next().slideUp()
}$("#mailUpdates").click(function(){if($(this).attr("checked")){$(this).parents("fieldset").next().slideDown()
}else{$(this).parents("fieldset").next().slideUp()
}});
$(".issuesInYear").issueTree();
$("#browseBySubject").subjectTree();
$("#globalMenu ul li:nth-child(3)").addResourceMenu();
$.ol.cleanAJAXResponse=function(h){if(h.indexOf("<body>")>-1){return/<body[^>]*>([\S\s]*?)<\/body>/.exec(h,"ig")[1]
}else{return h
}};
if(!$("#mailPromotionRequested").attr("checked")){$("#mailPromotionRequested").parents("fieldset").next().hide()
}$("#mailPromotionRequested").click(function(){if($(this).attr("checked")){$(this).parents("fieldset").next("fieldset").slideDown()
}else{$(this).parents("fieldset").next("fieldset").slideUp()
}return true
});
$.ol.textSlider=function(h,i){$(h).each(function(){var k=$(this),j=k.height();
if(j>=200){k.css({height:"20em",overflow:"hidden",position:"relative",marginBottom:"0.5em"});
$("<a/>",{text:i[0]}).toggle(function(){$(this).text(i[1]);
k.height(j);
return false
},function(){$(this).text(i[0]);
k.height("20em");
return false
}).insertAfter(k).wrap('<p id="showContent">')
}})
};
$.ol.textSlider("#bookHome #homepageContent",["More about this book summary","Less about this book summary"]);
$.ol.textSlider("#bookHomeSeries #homepageContent",["More about this book series","Less about this book series"]);
if($("#mrwHome").length>0){$.ol.textSlider("#mrwHome #homepageContent:has(~ #rightColumn, ~ #leftColumn)",["More about this book","Less about this book"])
}($.ol.keyStrokeCollector=function(){$(document).keydown(function(i){var h={ctrl:(i.ctrlKey)?true:false,shift:(i.shiftKey)?true:false,alt:(i.altKey)?true:false,key:i.keyCode};
$(this).data("keyDown",h)
});
$(document).keyup(function(h){$(this).removeData("keyDown")
})
})();
$(".decisionTree").dynamicSelectGroup();
$(".report_usage").dynamicReportScreen();
if($("#searchByCitation").length){$("#scope").append('<option value="byCitation">By Citation</option>');
$("#scope").change(function(){if($(this).find("option:selected").text()=="By Citation"){$("#searchByCitation").slideDown(function(){$("#searchText, #searchSiteSubmit").attr("disabled","disabled")
})
}else{$("#searchByCitation").slideUp(function(){$("#searchText, #searchSiteSubmit").removeAttr("disabled")
})
}});
$("#searchByCitation p.error").length&&$("#scope").val("byCitation").triggerHandler("change")
}$("#resourcesMenu ul").bgiframe({top:20});
$("#issueToc .figZoom img").each(function(){var h=$(this);
if(h.height()>300){h.height(300)
}if(h.width()>300){h.css("float","none")
}h.css("visibility","visible")
});
$("#fulltext .firstPageContainer img").load(function(){$(this).removeAttr("height").removeAttr("width");
if($(this).width()>752){$(this).width(752)
}}).each(function(){if(this.complete||(jQuery.browser.msie&&parseInt(jQuery.browser.version)==6)){$(this).triggerHandler("load")
}});
$("#fulltext a.movingMolecule").each(function(){$(this).click(function(){window.open($(this).attr("href"),$(this).index(),"width=1024,height=790,scrollbars=yes");
return false
})
});
if($("meta[name='citation_journal_title']").length||($("#pdf").length&&$("#productTitle").length)){var d=($("#pdf").length)?$("#productTitle").attr("href").split("(ISSN)")[1]:$("meta[name='citation_issn']").attr("content");
var a=($("#pdf").length)?window.location.href.split("/doi/")[1].split("/pdf")[0]:$("meta[name='citation_doi']").attr("content");
$.getJSON("http://www.deepdyve.com/rental-link?docId="+a+"&fieldName=journal_doi&journal="+d+"&affiliateId=wiley&format=jsonp&callback=?",function(i){if(i.status==="ok"){var k=$('<p><a class="rentalLink">Rent this article at DeepDyve</a></p>');
var j=$('<div id="deepDyve" class="topLeftRoundCornerNew"><h2>Rent this article through DeepDyve</h2><p>View a read-only copy of this article through our partner DeepDyve, the largest online rental service for scientific and scholarly content. DeepDyve will safeguard user privacy and your information will not be sold to a third party.</p><p>Read more about our pilot program making a portfolio of Biotechnology journals available through DeepDyve.</p><p><a href="http://eu.wiley.com/WileyCDA/PressRelease/pressReleaseId-84017.html">Press Release</a></p></div>');
k.find("a").attr("href",i.url);
j.insertAfter("#accessDenied .access .login");
k.clone(true).insertAfter("#deepDyve p:first");
var h=$('<li><span style="color: red; padding-right: 0.4em; font-weight: bold;">NEW!</span> </li>');
k.find("a").clone(true).appendTo(h);
h.appendTo("#accessDeniedOptions")
}})
}$("#downloadStatisticalData form").live("submit",function(){var h=$(this).find("#tAndCs"),i=$(this).find("label[for='tAndCs']");
if(!h.is(":checked")){if($(this).find(".error").length==0){$('<label class="error" for="tAndCs">Please agree to the terms and conditions.</label>').insertAfter(i)
}return false
}});
$("#usageData").loadDataTable();
$("#usageReports .announcement").unEscapeHtml(["strong"]);
$(".societyEAlerts").tabToggle();
$("#currentHoldings .success, #currentHoldings .error ").requestCSV();
$("#payPerViewPaymentDetails").processPaymentDetail();
var e=$("#promosAndTools .titleTools");
if(e.length){var f=(document.location.protocol==="https:")?"https://":"http://",g=f+"s7.addthis.com/js/250/addthis_widget.js#async=1";
window.addthis_config={pubid:"ra-51225be51b56b4c4",services_compact:"digg,diigo,citeulike,googlereader,www.mendeley.com,stumbleupon,facebook,twitter,delicious,researchgate,reddit",services_custom:{name:"mendeley",url:"http://www.mendeley.com?url={{url}}&title={{title}}",icon:"http://www.mendeley.com/favicon.ico"},data_track_clickback:true};
function b(){var o=["compoundindex","otherversions","reflink","issuetoc","pdf","abstract","figures","specialsection","full","tables","ppvFlow","references","summary","suppinfo","citedby"];
var m=document.URL,k=m.split("doi/"),p=k[0],l=k[1],j="",h=o.length,n;
for(n=0;
n<h;
n++){if(l.match(o[n])){j=l.split("/"+o[n]);
break
}}return p+"resolve/doi?DOI="+j[0]
}window.addthis_share={title:document.title.replace(/\-/g,""),url:b()};
$.getScript(g,function(){if(window.addthis){addthis.addEventListener("addthis.menu.share",function(){$("#at15s,#at16lb").css({display:"none",zIndex:"1"})
});
e.socialBookmarks();
addthis.init()
}})
}var c=window.institutions||[];
$("#institutionalAndAthensLogin #institutionName").autocomplete({source:c,minLength:2});
$(".wol_access_report_screen").reportScreen({reportType:"ol_access_report",reportTypeTrigger:false,reportNameURL:"admin/customer-access/fetchPageDetails",addReportURL:"admin/customer-access/queueReportRequest",getReportsURL:"admin/customer-access/fetchReports",deleteReportURL:"/admin/customer-access/archiveReport"});
$(".captcha").simpleCaptcha()
});
function toUnicode(a){var e="";
for(var b=0;
b<a.length;
b++){var d=a.charAt(b);
var c=a.charCodeAt(b);
if(c>"0xfff"){e+="\\u"+c.toString(16)
}else{if(c>"0xff"){e+="\\u0"+c.toString(16)
}else{if(c>"0x7f"){e+="\\u00"+c.toString(16)
}else{if(c<32){switch(d){case"\b":e+="\\b";
break;
case"\n":e+="\\n";
break;
case"\t":e+="\\t";
break;
case"\f":e+="\\f";
break;
case"\r":e+="\\r";
break;
default:if(c>"0xf"){e+="\\u00"+c.toString(16)
}else{e+="\\u000"+c.toString(16)
}break
}}else{switch(d){case"'":e+="\\'";
break;
case'"':e+='\\"';
break;
case"\\":e+="\\\\";
break;
case"/":e+="\\/";
break;
default:e+=d;
break
}}}}}}return e
};(function(f,d){var i,c,b,h,e=250;
var j=function(){i=d(".bannerWrapper");
c=i.find(".bannerDescription");
if(i.length){b=d('<a href="#" class="closeBanner" title="close">Close Banner</a>');
c.append(b);
a(true)
}},g=function(m){var k=(m!=null)?d(m.target):null,l=k.length?k.closest(".bannerWrapper"):null,n=(m!=null&&m.data!=null)?m.data.callback:null;
if(l.length){l.slideUp(e,function(){d(this).remove()
})
}a(false);
if(n&&typeof n==="function"){n()
}return false
},a=function(n){document.domain="wiley.com";
var l=d(parent.document.getElementsByTagName("frameset")[0]),o,m,k;
if(l.length){o=l.attr("rows");
m=parseInt(o.split(",")[0],10);
k=n?m+i.outerHeight():m-i.outerHeight();
l.attr("rows",o.replace(m,k))
}};
f.notification={dismiss:g,init:j};
return f
}(window.wol=window.wol||{},jQuery));
$(function(){wol.notification.init()
});(function(a,c){var b,f,d;
var e=function(){b=c("#cookieBanner");
f=b.find(".bannerDescription");
if(b.length){d=f.find(".closeBanner");
d.bind("click",{callback:function(){}},a.notification.dismiss)
}};
a.cookies={init:e};
return a
}(window.wol=window.wol||{},jQuery));
$(function(){wol.cookies.init()
});(function(a,e){var b,h,f,c=e(".shibbolethAccountControls"),d={create:"createPersonalShibbolethAccount",resign:"resignCreatingPersonalShibbolethAccount"};
var g=function(){b=e("#sttiBanner");
h=b.find(".bannerDescription");
if(b.length){f=h.find(".closeBanner");
f.bind("click",{callback:function(){var i="/closeCreatingPersonalShibbolethAccount";
e.post(i)
}},a.notification.dismiss)
}if(c.length){c.delegate(".shibbolethAccountControl","click",function(l){var j=this,k=j.id;
switch(k){case d.create:l.stopPropagation();
break;
case d.resign:var i=e(j).attr("href");
e.post(i,function(){var m=f.closest(".bannerWrapper");
if(m.length){m.slideUp(250,function(){e(this).remove()
})
}});
l.preventDefault();
break;
default:return false;
break
}})
}};
a.stti={init:g};
return a
}(window.wol=window.wol||{},jQuery));
$(function(){wol.stti.init()
});(function(l,j){var p=j(".shibbolethWidget"),y=j("#institutionName"),o=j("#institutionIdpUrl"),s=j("#selectInst"),r=p.find(".prevLogins"),k=p.find(".error"),b=r.find(".instName").length,x={};
var i=function(){s.removeClass("disabled").removeAttr("disabled");
y.removeClass("error ui-autocomplete-loading")
};
var a=function(){s.addClass("disabled").attr("disabled","disabled")
};
var e=function(z){if(z==="autocompleteselect"){k.remove()
}};
var d=function(A,z){x[A]=z
};
var m=function(z){return x[z]
};
var v=function(A,B){var z=[];
j.each(B,function(C,D){z.push({label:C,value:D})
});
d(A,z);
return z
};
var u=function(A,z){i();
z(A)
};
var f=function(C,z){var B=C.term.toLowerCase(),A=m(B);
if(A){u(A,z)
}else{j.ajax({url:"/widget/getinstitutiondetails",dataType:"json",data:{institutionname:encodeURIComponent(C.term)},success:function(E){var D=(E)?v(B,E):[];
u(D,z)
},error:function(E,F,D){return false
}})
}};
var c=function(z,A){y.val(A.item.label);
o.val(A.item.value);
e(z.type);
i();
return false
};
var h=function(){a();
y.autocomplete({source:f,minLength:3,select:c,focus:c,open:function(z,A){if(!j(".shibboleth-autocomplete").length){j(".ui-autocomplete").addClass("shibboleth-autocomplete")
}j(".ui-autocomplete").css("z-index",101)
}});
y.bind("blur keyup",function(){if(!y.val()){a()
}else{i()
}});
y.data("autocomplete")._resizeMenu=function(){this.menu.element.width(this.element.outerWidth()-2);
this.menu.element.css("top",parseInt(this.menu.element.css("top"),0))
};
y.data("autocomplete")._renderItem=function(B,D){var A=this.term.split(" ").join("|"),C=new RegExp("("+A+")","gi"),z=D.label.replace(C,"<b>$1</b>");
return j("<li></li>").data("item.autocomplete",D).append("<a>"+z+"</a>").appendTo(B)
}
};
var q=function(z){var A=j("#selectPrevInst");
z.prev(".rdo").attr("checked","checked");
A.trigger("click")
};
var g=function(A,z){var B=z.parent();
if(j.trim(A).toLowerCase()==="true"){B.fadeOut(900,function(){b--;
if(b===0){r.remove()
}j(this).remove()
})
}else{z.removeClass("waiting")
}};
var w=function(z){j.ajax({url:"/delinstitutionname",dataType:"text",charset:"utf-8",data:{institutionname:encodeURIComponent(z.val())},beforeSend:function(){z.addClass("waiting")
},success:function(A){g(A,z)
},error:function(B,C,A){return false
}})
};
var n=function(){r.delegate(".instLabel","click",function(){q(j(this))
}).delegate(".instName .actionBtn","click",function(A){A.preventDefault();
var z=j(this);
if(!z.hasClass("waiting")){w(z)
}})
};
var t=function(){if(y.length){h()
}s.val("Log in");
if(b){n()
}};
l.shibboleth={init:t};
return l
}(window.wol=window.wol||{},jQuery));
$(function(){wol.shibboleth.init()
});(function(a,c,e){var b=function(f){if(window.s&&s.apl){f.first().delegate("a","mouseenter",function(h){window.clearInterval(window.altmetricsPopover);
var g=c("#_altmetric_popover_el"),i=c(this);
if(g.is(":hidden")){window.altmetricsPopover=window.setInterval(function(){if(g.is(":visible")){window.clearInterval(window.altmetricsPopover)
}},500)
}})
}};
var d=function(){var h=c(".altmetric-embed");
if(h.length){var f=h.parents("#fancybox-inner").length,g="https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js";
h=f?c("#fancybox-inner .altmetric-embed"):h;
if(window._altmetric){_altmetric_embed_init()
}else{c.getScript(g)
}b(h)
}};
a.altmetrics={init:d};
return a
}(window.wol=window.wol||{},jQuery));
$(document).ready(function(){wol.altmetrics.init()
});$(document).ready(function(){$(".js-header-user-access__trigger").click(function(c){var a=$("#login"),b=$(this).find(".icons-user-access-arrow"),d=$("#login"),f=250;
if(a.is(":visible")){d.fadeOut(f);
b.removeClass("icons-user-access-arrow_close");
b.addClass("icons-user-access-arrow_open")
}else{d.fadeIn(f);
b.removeClass("icons-user-access-arrow_open");
b.addClass("icons-user-access-arrow_close")
}return false
});
(function(){var b=$(".js-header-user-access__trigger"),a=b.find(".icons-user-access-arrow"),c=$("#login").not(".loggedIn");
c.mouseup(function(){return false
});
$(this).mouseup(function(d){if(!($(d.target).parent(".js-header-user-access__trigger").length>0)){c.fadeOut(250);
a.removeClass("icons-user-access-arrow_close");
a.addClass("icons-user-access-arrow_open")
}});
$(document).bind("keydown keypress",function(d){if(d.which==="27"){c.fadeOut(250);
a.removeClass("icons-user-access-arrow_close");
a.addClass("icons-user-access-arrow_open")
}})
}())
});(function(g,d){var c={padding:0,autoDimensions:false,width:480,height:"auto",autoScale:false,centerOnScroll:true,titleShow:false};
var f='<div class="loginContainer confirmContainer"><h1>Error</h1><p class="navAction message"><a href="#" id="confirm" class="actionBtn okBtn">OK</a>There has been an unexpected error, please try again.</p></div>';
var i=function(l){l.preventDefault();
var k=[],j;
c.target=d(l.target);
if(c.target.attr("type")&&c.target.attr("type")=="submit"){d(".validationRequired").validate({onclick:false,onfocusout:false,onkeyup:false,rules:{_checkbox_var:{required:true,minlength:1}},messages:{_checkbox_var:"Please select a journal title"},submitHandler:function(m){d.fancybox.staticUseSetup();
d.fancybox.showActivity();
j=d(m).attr("action");
k=d(m).serializeArray();
k.push({name:"reqType",value:"ajax"});
a(j,k)
}});
d(".validationRequired").submit()
}else{d.fancybox.staticUseSetup();
d.fancybox.showActivity();
j=c.target.attr("href");
k.push({name:"reqType",value:"ajax"});
a(j,k)
}};
var a=function(k,j){d.ajax({type:"GET",cache:false,url:k,data:j,success:function(l){b(l)
},error:function(){b(f)
}})
};
var e=function(l){d.fancybox.showActivity();
var k=d(l).attr("action");
var j=d(l).serializeArray();
j.push({name:"reqType",value:"ajax"});
d.ajax({type:"POST",cache:false,url:k,data:j,success:function(m){b(m)
},error:function(){d.fancybox.hideActivity();
var m=d('<p class="errorMsg">There has been an error, please try again.</p>');
d(".loginForm").find("input[name=password]").parent(".formField").after(m);
d.fancybox.resize()
}})
};
var b=function(j){c.content=j;
c.onComplete=function(){d("#cancelLogin").click(function(k){k.preventDefault();
d.fancybox.close()
});
d("#standaloneLogin").validate({onclick:false,onfocusout:false,onkeyup:false,submitHandler:function(k){e(k)
}});
d(".okBtn").click(function(k){k.preventDefault();
d.fancybox.close()
})
};
c.onCleanup=function(){var k=d(".okBtn").length&&d(".okBtn").parents("#fancybox-tmp").length!=1;
if(k){window.location.reload(true)
}};
d.fancybox(c)
};
var h=function(j){d.each(j.elms,function(l,m){var k=d(m);
k.click(i)
})
};
g.login={init:h};
return g
}(window.wol=window.wol||{},jQuery));
$(document).ready(function(){wol.login.init({elms:[".authReq"]})
});(function(i,h,f){var j=function(){h(".btnDecline").bind("click",function(o){o.preventDefault();
h.fancybox.close()
})
};
var n={invalidPages:[],viewPercentage:50,expiryDate:null,cookie:{key:"wolSurvey",value:"survey-seen"},width:400,height:400,padding:0,autoDimensions:false,autoScale:false,centerOnScroll:true,hideOnOverlayClick:false,onComplete:j};
var g=function(){var o=location.href,p=o.split("/");
return(o.lastIndexOf("/")!==o.length-1?p[p.length-1]:p[p.length-2])
};
var e=function(){var o=b();
var p=o<n.viewPercentage;
return p
};
var b=function(){return Math.floor(Math.random()*100)
};
var a=function(o){return h.inArray(o,n.invalidPages)===-1
};
var d=function(){var p=window.location.href.match(/(\?|&)interceptDebug($|&|=)/);
var o,q;
if(p){o=m("viewPercentage");
n.viewPercentage=o;
if(m("deleteCookie")=="1"){h.cookie(n.cookie.key,null,{path:"/"})
}}return p
};
var m=function(p){p=p.replace(/[\[]/,"\\[").replace(/[\]]/,"\\]");
var o="[\\?&]"+p+"=([^&#]*)";
var r=new RegExp(o);
var q=r.exec(window.location.search);
if(q==null){return""
}else{return decodeURIComponent(q[1].replace(/\+/g," "))
}};
var l=function(w){h.extend(n,w);
if(typeof n.expiryDate=="string"){var p=n.expiryDate.split("/");
var s=new Date(p[0],(p[1]-1),p[2]);
n.expiryDate=s
}else{n.expiryDate=new Date(new Date().getUTCFullYear()+1,new Date().getUTCMonth(),new Date().getUTCDate())
}var v=d(),o=g(),t=a(o),r=(h.cookie(n.cookie.key)==n.cookie.value),u=e(),q=(new Date()<n.expiryDate);
if(v){if(u&&!r){c()
}}else{if(q&&!r&&t&&u){h.cookie(n.cookie.key,n.cookie.value,{expires:new Date(n.expiryDate.setDate(n.expiryDate.getDate()+1)),path:"/"});
c()
}}};
var k=function(){h.getScript(i.config.staticAssetUrl+"js/jquery/jquery.ba-postmessage.js",function(){jQuery.receiveMessage(function(o){if(o.data==="closeFancyBox"){h.fancybox.close();
jQuery.receiveMessage()
}},i.config.staticAssetUrl.slice(0,-1));
h.fancybox(n)
})
};
var c=function(){if(n.href){n.type="iframe";
k()
}else{h("head").append('<link rel="stylesheet" href="../intercepts/css/interceptSurvey.css" type="text/css" />');
h.fancybox(n)
}};
i.intercept={init:l};
return i
}(window.wol=window.wol||{},jQuery));
$(document).ready(function(){wol.intercept.init({href:wol.config.staticAssetUrl+"intercepts/wol-survey.html?targetUrl="+encodeURIComponent(this.location.href),invalidPages:["pdf","full","abstract","references","citedby","suppinfo","versions","otherversions","figures","tables","compoundindex"],viewPercentage:15,expiryDate:"2013/08/31"})
});(function(a,c){var e=function(){c("a.rightsLink").bind("click",function(f){f.preventDefault();
b(c(this).attr("href"))
})
};
var b=function(f){var f=f.replace("%2526","%26");
window.open(f,"Rightslink","location=no,toolbar=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=650,height=550")
};
var d=function(){e()
};
a.rightsLink={init:d};
return a
}(window.wol=window.wol||{},jQuery));
$(function(){wol.rightsLink.init()
});(function(a){a.widget("ol.simpleCaptcha",{options:{imageCaptchaURL:"/captcha/html/image",audioCaptchaURL:"/captcha/html/audio",refreshImageCaptchaURL:"/captcha/image",refreshAudioCaptchaURL:"/captcha/audio",downloadAudioURL:"/captcha/download/audio",answerText:".captchAnswer"},vars:{audioCaptcha:".audio_captcha",bindAudioEvents:false},_create:function(){this._createTextCaptcha()
},_bindTextCaptchaActions:function(){var b=this,d=b.options,c=b.element;
c.delegate(".audioCaptcha","click",function(f){b._createAudioCaptcha();
f.preventDefault()
});
c.delegate(".text_captcha_refresh","click",function(f){b._refreshTextCaptcha();
f.preventDefault()
})
},_bindAudioCaptchaActions:function(){var b=this,d=b.options,c=b.element;
c.delegate(".textCaptcha","click",function(f){b._createTextCaptcha();
f.preventDefault()
});
if(!b.vars.bindAudioEvents){c.delegate(".audio_captcha_refresh","click",function(f){b._createAudioCaptcha();
f.preventDefault()
});
b.vars.bindAudioEvents=true
}},_createTextCaptcha:function(){var b=this,d=b.options,c=b.element;
a.ajax({url:d.imageCaptchaURL,data:"",type:"GET",success:function(e){a(c).html(e);
b._bindTextCaptchaActions()
}})
},_createAudioCaptcha:function(){var b=this,d=b.options,c=b.element;
a.ajax({url:d.audioCaptchaURL,data:"",type:"GET",cache:false,success:function(e){a(b.element).html(e);
b._bindAudioCaptchaActions();
if(b._isAudioSupported){a(b.vars.audioCaptcha).addClass("show_audio")
}}})
},_refreshTextCaptcha:function(){this.element.find(".text_captcha").attr("src",this.options.refreshImageCaptchaURL+"?"+new Date().getTime());
this._resetAnswer()
},_refreshAudioCaptcha:function(){var b=this,d=b.options,c=b.element;
c.find(b.vars.audioCaptcha).attr("src",this.options.refreshAudioCaptchaURL+"?"+new Date().getTime());
c.find(".download_audio").attr("href",this.options.downloadAudioURL);
c.find(b.vars.audioCaptcha).load();
b._resetAnswer()
},_resetAnswer:function(){this.element.find(this.options.answerText).val("")
},_isAudioSupported:function(){var b=document.createElement("audio");
return !!(b.canPlayType&&b.canPlayType('audio/wav; codecs="1"').replace(/no/,""))
}})
})(jQuery);