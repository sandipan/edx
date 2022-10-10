(function(a){a.fn.searchSelectAll=function(){return this.each(function(){var b=a(this).closest("ol, ul");
var c=a(this);
c.is(":checked")&&b.find("li > input").not(c).attr("checked","checked");
b.delegate("input","click",function(){if(a(this).attr("id")==c.attr("id")){if(a(this).is(":checked")){b.find("li > input").not(c).attr("checked","checked")
}else{b.find("li > input").attr("checked","")
}}else{if(a(this).is(":checked")){(b.find("li > input:checked").not(c).length==b.find("li > input").not(c).length)&&c.attr("checked","checked")
}else{c.attr("checked","")
}}})
})
};
a.fn.slider=function(){var c=a("#authorsDetail, #editorsDetail, #publicationHistoryDetails, #howToCite, #errata, #fundingInfo, #isbnInfo, #bookSeriesInfo");
var b=0;
var e=a("<a href='#'>(Show All)</a>");
if(c.length>0){var d=a('<p id="toggleAddInfo"></p>');
c.each(function(){var g=a(this);
var f;
g.bind("slider",function(){if(a(this).is(":visible")){a(this).slideUp();
b--
}else{a(this).slideDown();
b++
}if(b==0){e.text("(Show All)")
}else{if(b==c.length){e.text("(Hide All)")
}}});
if(a(this).attr("id")=="authorsDetail"){f="Author Information"
}else{if(a(this).attr("id")=="editorsDetail"){f="Editor Information"
}else{if(a(this).attr("id")=="publicationHistoryDetails"){f="Publication History"
}else{if(a(this).attr("id")=="howToCite"){f="How to Cite"
}else{if(a(this).attr("id")=="fundingInfo"){f="Funding Information"
}else{if(a(this).attr("id")=="isbnInfo"){f="ISBN Information"
}else{if(a(this).attr("id")=="bookSeriesInfo"){f="Book Series Information"
}else{f="Corrections"
}}}}}}}a("<a href='#'>"+f+"</a>").click(function(){g.trigger("slider");
return false
}).appendTo(d)
});
d.insertAfter("#additionalInformation .articleCategory");
e.click(function(){if(a(this).text()=="(Show All)"){c.show();
a(this).text("(Hide All)");
b=c.length
}else{c.hide();
a(this).text("(Show All)");
b=0
}return false
}).appendTo("#additionalInformation .articleCategory")
}};
a.fn.subjectTree=function(){var b=function(f){var c=a(this),i=c.children("div"),h=a("body").height();
c.parent().children("li").removeClass("hover");
i.css("width",c.find("ol").length*15+"em");
c.addClass("hover");
if(c.data("done")){return
}c.data("done",true);
var d=Math.floor(i.offset().top)+Math.floor(i.outerHeight())+130;
if(d>h){var g=h-d;
i.css("top",g)
}};
return this.each(function(){a(this).children("li").hover(b,function(){a(this).removeClass("hover")
}).children("a").attr("href","#").keydown(function(d){if(d.which==13){d.preventDefault();
var c=a(this).parent();
if(c.hasClass("hover")){c.removeClass("hover")
}else{b.call(c)
}return false
}}).end().find("> div li a").focus(function(){a(this).parent().addClass("hover")
}).blur(function(){a(this).parent().removeClass("hover")
})
})
};
a.fn.profileMenu=function(){return this.each(function(){var b=false;
a(this).hover(function(){if(!b){a(this).find("ul").fadeIn("fast",function(){});
b=true
}},function(){if(b){a(this).find("ul").fadeOut("slow",function(){b=false
})
}})
})
};
a.fn.issueTree=function(){this.each(function(){a(this).click(function(){var g=a(this).attr("href").split("/journal/")[1].split("/issues")[0];
var f=(a(this).attr("href")).split("?")[1].split("=")[1];
var e=a(this).next("ol");
if(e&&e.css("display")=="block"){e.slideUp(function(){a(this).prev().removeClass("open").addClass("closed");
c()
})
}else{if(e&&e.css("display")=="none"){e.slideDown(function(){a(this).prev().removeClass("closed").addClass("open");
c()
})
}else{if(!a(this).hasClass("fetching")){var h=a(this);
a.ajax({type:"GET",url:"/journal/"+g+"/issues/fragment?activeYear="+f+"&SKIP_DECORATION=true",dataType:"html",beforeSend:function(){a(h).removeClass("closed").addClass("fetching")
},success:function(i){a(h).after(a(i).css("display","none"));
a(h).next("ol").slideDown(function(){a(this).prev().removeClass("fetching").addClass("open");
c()
})
},error:function(i,j,k){a(this).prev().removeClass("fetching").addClass("closed")
}})
}}}return false
})
});
function c(){a.cookie("allIssuesTree",null,{path:"/"});
var e=[];
a(".issueVolumes>li").each(function(f,g){e[f]=a(g).find("ol").css("display")=="block"?1:0
});
a.cookie("allIssuesTree",b()+" "+e.join(""),{path:"/"})
}function d(){var f=a.cookie("allIssuesTree");
if(f&&f.substring(0,f.indexOf(" "))==b()&&a(".issueVolumes").length){var e=f.substr(f.indexOf(" ")+1).split("");
a(".issueVolumes>li").each(function(g,h){if(e[g]==1){a(h).find("a").click()
}})
}}function b(){var f=window.location.pathname;
var e=f.substr(f.indexOf("journal/"));
e=e.substring(0,e.indexOf("/issues"));
return e
}d();
return this
};
a.fn.selectAll=function(){(this.length>0)?a(".selectAll fieldset").show():0;
return this.each(function(){if(a(this).parents("ol").length==0){var d=a(this),c=d.parents("form"),b=c.find("div.selectAll input[type='checkbox']"),e=(d.parents("#admin").length>0)?c.find("td input[type='checkbox']"):c.find("div.access input[type='checkbox']");
if(d.hasClass("contentAlerts")){e=d.find(".societyAlertList input[type='checkbox']")
}c.delegate("input[type='checkbox']","click",function(f){if(a(this).parents("div").hasClass("selectAll")){if(a(this).is(":checked")){a(e).attr("checked","checked");
a(b).attr("checked","checked").next("label").text("Deselect All")
}else{a(e).removeAttr("checked");
a(b).removeAttr("checked").next("label").text("Select All")
}}else{if(e.filter(":checked").length===e.length){a(b).attr("checked","checked").next("label").text("Deselect All")
}else{a(b).removeAttr("checked").next("label").text("Select All")
}}})
}})
};
a.fn.selectAllNew=function(b){return this.each(function(g){var f=a('<div class="selectAll"><input type="checkbox" name="selectAll" class="selectAll" value="selectAll"/><label>Select All</label></div>');
var c="selectAll"+g;
f.find("input").attr("id",c).next().attr("for",c);
a.each(b,function(h,j){a(j)[h](f.clone())
});
var e=a(this).find("input[type='checkbox']:not(.selectAll)");
var d=a(this).find("input.selectAll");
a(this).delegate("input[type='checkbox']","click",function(){if(a(this).hasClass("selectAll")){if(a(this).is(":checked")){a(e).attr("checked","checked");
a(d).attr("checked","checked").next("label").text("Deselect All")
}else{a(e).removeAttr("checked");
a(d).removeAttr("checked").next("label").text("Select All")
}}else{if(e.filter(":checked").length==e.length){a(d).attr("checked","checked").next("label").text("Deselect All")
}else{a(d).removeAttr("checked").next("label").text("Select All")
}}})
})
};
a.fn.loginLabels=function(){return this.each(function(){a(this).val("");
if(a(this).val()!=""){a(this).prev().hide()
}a(this).focus(function(){a(this).prev().hide()
}).blur(function(){if(a(this).val()==""){a(this).prev().show()
}})
})
};
a.fn.contextFilter=function(){var b=a(".contextReceiver").clone();
return a(this).change(function(){var e=this,d=a(this).siblings(".contextReceiver"),h=a(e).find("option:selected").text(),g=b.clone(),f="",c=a('<optgroup label=""><option value="">Select your region</option></optgroup>');
if(!b.find("optgroup[label="+h+"]").length){d.find("option[selected]").removeAttr("selected");
d.val("");
d.prev("label").andSelf().hide()
}else{f=g.find("optgroup[label="+h+"]");
a(".contextReceiver").empty().append(c).append(f).prev("label").andSelf().show();
a(".contextReceiver optgroup").css({width:"100%"})
}}).trigger("change")
};
a.fn.fileUploadFix=function(){return this.each(function(){a("label[for='"+a(this).attr("id")+"']").after('<input id="'+a(this).attr("id")+'Dummy" class="fileUpload" style="width:12.35em" /><div class="dummyFileButton" id="'+a(this).attr("id")+'DummySubmit"><input type="button" value="Browse" class="dummyFileButton" /></div>').add(this).add("#"+a(this).attr("id")+"Dummy").add("#"+a(this).attr("id")+"DummySubmit").wrapAll(a('<div class="uploadContainer" />')).eq(1).addClass("fileUpload").css({opacity:"0","z-index":1}).change(function(){a("#"+a(this).attr("id")+"Dummy").val(a(this).val())
}).trigger("change")
})
};
a.fn.addResourceMenu=function(){var c={"1":{link:"http://olabout.wiley.com/WileyCDA/Section/id-390244.html",text:"Training and Tutorials"},"2":{link:"http://olabout.wiley.com/WileyCDA/Section/id-404512.html",text:"For Researchers"},"3":{link:"http://olabout.wiley.com/WileyCDA/Section/id-404513.html",text:"For Librarians"},"4":{link:"http://olabout.wiley.com/WileyCDA/Section/id-404518.html",text:"For Societies"},"5":{link:"http://olabout.wiley.com/WileyCDA/Section/id-404516.html",text:"For Authors"},"6":{link:"http://olabout.wiley.com/WileyCDA/Section/id-390236.html",text:"For Advertisers"},"7":{link:"http://olabout.wiley.com/WileyCDA/Section/id-390242.html",text:"For Media"},"8":{link:"http://olabout.wiley.com/WileyCDA/Section/id-390243.html",text:"For Agents"}};
var d=a('<div id="resourcesMenu"></div>');
var b=a("<ul/>");
jQuery.each(c,function(f,e){a("<li><a href="+e.link+">"+e.text+"</a></li>").appendTo(b)
});
a(b).appendTo(d);
a(this).append(d)
};
a.fn.mrwTables=function(){return this.each(function(){a('<a href="#" class="viewTable">View table</a>').prependTo(a(this).children(".title")).toggle(function(){a(this).text("Hide table").parent().next(".table-container").slideDown("fast",function(){a(this).css("zoom",1)
});
return false
},function(){a(this).text("View table").parent().next(".table-container").slideUp();
return false
});
location.hash.split("#")[1]&&(a(this).attr("id")==location.hash.split("#")[1])&&a(this).find(".viewTable").trigger("click")
})
};
a.fn.jumpList=function(){if(this.length<1){return
}var e=this,g=e.first(0),b=g.parent().width(),d=a('<select class="jumpSelect" ><option value="jumpTo">Jump to&hellip;</option></select>');
didScroll=true,options="",selectWidth=g.width()+55;
a("#content").delegate(".jumpSelect","change",function(){var h=a(this);
window.location.hash="";
window.location.hash=h.val();
h.val("jumpTo");
a(document).trigger("scroll")
}).delegate(".jumpSelect","focusin, mousedown",function(){var h=a(this);
if(h.find("option").length===1){h.append(options)
}});
options=(function f(){var l,n=g.children("li").find("a:first"),k=n.length,j,h,m=[];
for(l=0;
l<k;
l++){j=n.eq(l);
h=j.getAltAndText();
(h.length>120)&&(h=h.substring(0,120)+"&hellip;");
m[l]='<option value="'+j.attr("href")+'">'+h+"</option>"
}return m.join("")
})();
if(selectWidth<=b){d.css("width",((selectWidth<438)?selectWidth:438))
}else{d.css({clear:"left",width:"100%",marginLeft:0})
}a(window).resize(function(){didScroll=true
}).scroll(function(){didScroll=true
});
setInterval(function(){if(didScroll){didScroll=false;
c(e)
}},500);
function c(h){h.each(function(){var j=a(this),l=j.prev(),i=a(document).scrollTop(),k=l.offset().top;
if((k>i-20)&&(k<i+a(window).height())){if(!l.find(".jumpSelect").length){d.clone(true).prependTo(j.prev())
}}})
}};
a.fn.getAltAndText=function(){var b=this.find("img");
if(b.length){a.each(b,function(){var c=a(this);
c.replaceWith(c.attr("alt"))
})
}return this.html()
};
a.fn.socialBookmarks=function(){return this.each(function(){var c='<a href="http://www.addthis.com/bookmark.php?v=250&amp;username=ra-51225be51b56b4c4" class="addthis_button_compact">Share</a>',d='<span class="addthis_separator">|</span>',b='<a class="addthis_button_citeulike"></a><a class="addthis_button_facebook"></a><a class="addthis_button_delicious"></a><a class="addthis_button_www.mendeley.com"></a><a class="addthis_button_twitter"></a>';
a("<div/>",{"class":"addthis_toolbox addthis_default_style"}).html(c+d+b).insertAfter(a(this))
})
};
a.fn.selectText=function(){var d=a(this)[0];
if(a.browser.msie){var b=document.body.createTextRange();
b.moveToElementText(d);
b.select()
}else{if(a.browser.mozilla||a.browser.opera){var c=d.ownerDocument.defaultView.getSelection();
var b=d.ownerDocument.createRange();
b.selectNodeContents(d);
c.removeAllRanges();
c.addRange(b)
}else{if(a.browser.safari){var c=d.ownerDocument.defaultView.getSelection();
c.setBaseAndExtent(d,0,d,1)
}}}return this
};
a.fn.loadDataTable=function(){return this.each(function(){var c=a(this).find("p a").attr("href"),b=a("<div class='loading'>Loading usage data&hellip;</div>"),d=a(this);
d.empty();
d.css("display","block");
d.append(b);
a.ajax({url:c,success:function(e){d.find(".loading").slideUp();
d.append(e);
a(d).clipBoard()
},error:function(e){d.find(".loading").html("Error displaying usage data");
d.find(".loading").addClass("error")
}})
})
};
a.fn.clipBoard=function(){if(typeof ZeroClipboard!="undefined"){var c=null,d,b;
if(location.protocol=="file:"){d="../js/zeroclipboard/zeroclipboard10.swf"
}else{if(location.host=="showroom.wiley.com"){d="http://showroom.wiley.com/projectAssets/srSubversionStorageAccessor/6ce4edfd0253e5c0fe8cc6ea3931e2ce/-1/zeroclipboard/zeroclipboard10.swf"
}else{d=location.protocol+"//"+location.host+"/js/zeroclipboard/zeroclipboard10.swf"
}}d=d.replace(/onlinelibrary/,"onlinelibrarystatic");
ZeroClipboard.setMoviePath(d);
c=new ZeroClipboard.Client();
a("#usageData table tbody tr td, input#tableCopyButton").mouseover(function(){b=a(this);
c.setText(this.innerHTML);
if(c.div){c.receiveEvent("mouseout",null);
c.reposition(this)
}else{c.glue(this)
}if(b.attr("id")!="tableCopyButton"){c.setHandCursor(false);
a("#ZeroClipboardMovie_1").parent().width(a(b).width()+10).height(a(b).height()+10);
a("#ZeroClipboardMovie_1").width(a(b).width()+10).height(a(b).height()+10)
}else{c.setHandCursor(true);
a("#ZeroClipboardMovie_1").parent().width(a(b).width()).height(a(b).height());
a("#ZeroClipboardMovie_1").width(a(b).width()).height(a(b).height());
c.setText("<table>"+a("#usageDataTable").html()+"</table>")
}c.receiveEvent("mouseover",null)
});
c.addEventListener("onComplete",function(){var e=a('<label class="advice">Copied table to clipboard</label>'),f=b.attr("id");
if(f=="tableCopyButton"){b.parent().find("label").each(function(){a(this).remove()
});
a(b).after(e);
a(e).delay(7000).fadeOut()
}else{a(b).selectText()
}})
}};
a.fn.unEscapeHtml=function(d){var c=[];
(d)&&a.extend(c,d);
var b={renderHtmlTag:function(e){for(var h=0;
h<c.length;
h++){var g=new RegExp("&lt;"+c[h]+"&gt;","gi"),f=new RegExp("&lt;/"+c[h]+"&gt;","gi");
startMatches=a(e).html().match(g)||[],endMatches=a(e).html().match(f)||[];
for(var l=0;
l<startMatches.length;
l++){if(endMatches[l]!=null){var j=new RegExp(startMatches[l],""),k=new RegExp(endMatches[l],"");
a(e).html(a(e).html().replace(j,"<"+c[h]+">"));
a(e).html(a(e).html().replace(k,"</"+c[h]+">"))
}}}}};
return this.each(function(){a(this).find("p").each(function(){b.renderHtmlTag(a(this))
})
})
};
a.fn.requestCSV=function(){if(this.length<1){return
}return this.each(function(){var b=a(this),c=b.find("a.proceed");
c.click(function(d){b.slideUp(function(){b.remove()
});
d.preventDefault()
})
})
};
a.fn.processPaymentDetail=function(){if(a(this).length==0){return
}return this.each(function(){var i=a(this),h=i.find("form"),e=h.find('input.submit[value="Submit"]'),f=a('a, input[type="submit"]'),d=a("body");
e.removeAttr("disabled");
e.click(function(m){var k=a('<div class="processing"><p>Processing Payment Details</p></div>'),n=a('<input type="hidden" name="ajaxSource" value="true"/>'),j=a('<input type="hidden" name="_eventId_makePayment" value="_eventId_makePayment"/>'),l="An error has occurred.";
d.append(k);
h.append(n);
h.append(j);
a(".processing").css({height:a(document).height()});
if(i.find(".error").length>0){i.find(".error").each(function(){a(this).slideUp(function(){a(this).remove()
})
})
}a.ajax({type:"POST",data:a(h).serialize(),url:h.attr("action"),success:function(o){try{switch(o){case null:case"":b("The payment process has timed out.");
break;
case"transIdProcessed":b("Your order is being processed, please wait for this to complete. For any payment or access problems, please contact cs-journals@wiley.com.",false);
e.attr("disabled",true);
break;
default:c(JSON.parse(o),"post")
}g(k)
}catch(p){g(k);
b(l)
}},error:function(o){g(k);
b(l)
}});
n.remove();
j.remove();
m.preventDefault()
});
var c=function(k,l){if(k.wpgAvailable==="true"){var j=a("<form></form>").attr({method:l,action:k.URL});
a.each(k.success,function(m,n){a.each(n instanceof Array?n:[n],function(o,p){a(document.createElement("input")).attr({type:"hidden",name:m,value:p}).appendTo(j)
})
});
d.append(j);
j.submit()
}else{b("Sorry, the Payment Gateway is not available. Please try again later.",false)
}};
var g=function(j){j.fadeOut(function(){a(this).remove()
})
};
var b=function(m,l){l=typeof l!=="undefined"?l:true;
var j=a('<div class="error">'+m+" </div>"),k=a('<a href="#" class="timeout-refresh">Please click here to continue.</a>');
a(k).click(function(n){location.reload(true);
n.preventDefault()
});
if(l){j.append(k)
}a(".payPerViewForm").before(j)
}
})
};
a.fn.tabToggle=function(){if(a(this).length==0){return
}return this.each(function(){var d=a(this),b=d.find(".tabbedContent"),c=d.find(".tabContent");
b.delegate("li a","click",function(h){var g=a(this),f=g.parent().index();
h.preventDefault();
b.find("li").each(function(){var i=a(this),e=i.index();
if(e!==f){i.removeClass("active");
c.eq(e).hide()
}else{g.parent().addClass("active");
c.eq(f).show()
}})
})
})
}
})(jQuery);