(function(A){var J,S,Q,K,d,w,I,N,z,D=0,H={},h=[],e=0,F={},y=[],f=null,m=new Image(),g=/\.(jpg|gif|png|bmp|jpeg)(.*)?$/i,k=/[^\.]\.(swf)\s*$/i,q,L=1,a,c,O=false,C=20,t=A.extend(A("<div/>")[0],{prop:0}),j=0,R=!A.support.opacity&&!window.XMLHttpRequest,i=function(){S.hide();
m.onerror=m.onload=null;
if(f){f.abort()
}J.empty()
},p=function(){A.fancybox('<p id="fancybox_error">The requested content cannot be loaded.<br />Please try again later.</p>',{scrolling:"no",padding:20,transitionIn:"none",transitionOut:"none"})
},E=function(){return[A(window).width(),A(window).height(),A(document).scrollLeft(),A(document).scrollTop()]
},b=function(){var V=E(),ac={},aa=F.margin,W=F.autoScale,ab=(C+aa)*2,Z=(C+aa)*2,X=(F.padding*2),Y;
if(F.width.toString().indexOf("%")>-1){ac.width=((V[0]*parseFloat(F.width))/100)-(C*2);
W=false
}else{ac.width=F.width+X
}if(F.height.toString().indexOf("%")>-1){ac.height=((V[1]*parseFloat(F.height))/100)-(C*2);
W=false
}else{ac.height=F.height+X
}if(W&&(ac.width>(V[0]-ab)||ac.height>(V[1]-Z))){if(H.type=="image"||H.type=="swf"){ab+=X;
Z+=X;
Y=Math.min(Math.min(V[0]-ab,F.width)/F.width,Math.min(V[1]-Z,F.height)/F.height);
ac.width=Math.round(Y*(ac.width-X))+X;
ac.height=Math.round(Y*(ac.height-X))+X
}else{ac.width=Math.min(ac.width,(V[0]-ab));
ac.height=Math.min(ac.height,(V[1]-Z))
}}ac.top=V[3]+((V[1]-(ac.height+(C*2)))*0.5);
ac.left=V[2]+((V[0]-(ac.width+(C*2)))*0.5);
if(F.autoScale===false){ac.top=Math.max(V[3]+aa,ac.top);
ac.left=Math.max(V[2]+aa,ac.left)
}return ac
},M=function(V){if(V&&V.length){switch(F.titlePosition){case"inside":return V;
case"over":return'<span id="fancybox-title-over">'+V+"</span>";
default:return'<span id="fancybox-title-wrap"><span id="fancybox-title-left"></span><span id="fancybox-title-main">'+V+'</span><span id="fancybox-title-right"></span></span>'
}}return false
},s=function(){var X=F.title,W=c.width-(F.padding*2),V="fancybox-title-"+F.titlePosition;
A("#fancybox-title").remove();
j=0;
if(F.titleShow===false){return
}X=A.isFunction(F.titleFormat)?F.titleFormat(X,y,e,F):M(X);
if(!X||X===""){return
}A('<div id="fancybox-title" class="'+V+'" />').css({width:W,paddingLeft:F.padding,paddingRight:F.padding}).html(X).appendTo("body");
switch(F.titlePosition){case"inside":j=A("#fancybox-title").outerHeight(true)-F.padding;
c.height+=j;
break;
case"over":A("#fancybox-title").css("bottom",F.padding);
break;
default:A("#fancybox-title").css("bottom",A("#fancybox-title").outerHeight(true)*-1);
break
}A("#fancybox-title").appendTo(d).hide()
},o=function(){A(document).unbind("keydown.fb").bind("keydown.fb",function(V){if(V.keyCode==27&&F.enableEscapeButton){V.preventDefault();
A.fancybox.close()
}else{if(V.keyCode==37){V.preventDefault();
A.fancybox.prev()
}else{if(V.keyCode==39){V.preventDefault();
A.fancybox.next()
}}}});
if(A.fn.mousewheel){K.unbind("mousewheel.fb");
if(y.length>1){K.bind("mousewheel.fb",function(V,W){V.preventDefault();
if(O||W===0){return
}if(W>0){A.fancybox.prev()
}else{A.fancybox.next()
}})
}}if(!F.showNavArrows){return
}if((F.cyclic&&y.length>1)||e!==0){N.show()
}if((F.cyclic&&y.length>1)||e!=(y.length-1)){z.show()
}},T=function(){var V,W;
if((y.length-1)>e){V=y[e+1].href;
if(typeof V!=="undefined"&&V.match(g)){W=new Image();
W.src=V
}}if(e>0){V=y[e-1].href;
if(typeof V!=="undefined"&&V.match(g)){W=new Image();
W.src=V
}}},v=function(){w.css("overflow",(F.scrolling=="auto"?(F.type=="image"||F.type=="iframe"||F.type=="swf"?"hidden":"auto"):(F.scrolling=="yes"?"auto":"visible")));
if(!A.support.opacity){w.get(0).style.removeAttribute("filter");
K.get(0).style.removeAttribute("filter")
}A("#fancybox-title").show();
if(F.hideOnContentClick){w.one("click",A.fancybox.close)
}if(F.hideOnOverlayClick){Q.one("click",A.fancybox.close)
}if(F.showCloseButton){I.show()
}o();
A(window).bind("resize.fb",A.fancybox.center);
if(F.centerOnScroll){A(window).bind("scroll.fb",A.fancybox.center)
}else{A(window).unbind("scroll.fb")
}if(A.isFunction(F.onComplete)){F.onComplete(y,e,F)
}O=false;
T()
},G=function(Z){var W=Math.round(a.width+(c.width-a.width)*Z),V=Math.round(a.height+(c.height-a.height)*Z),Y=Math.round(a.top+(c.top-a.top)*Z),X=Math.round(a.left+(c.left-a.left)*Z);
K.css({width:W+"px",height:V+"px",top:Y+"px",left:X+"px"});
W=Math.max(W-F.padding*2,0);
V=Math.max(V-(F.padding*2+(j*Z)),0);
w.css({width:W+"px",height:V+"px"});
if(typeof c.opacity!=="undefined"){K.css("opacity",(Z<0.5?0.5:Z))
}},x=function(V){var W=V.offset();
W.top+=parseFloat(V.css("paddingTop"))||0;
W.left+=parseFloat(V.css("paddingLeft"))||0;
W.top+=parseFloat(V.css("border-top-width"))||0;
W.left+=parseFloat(V.css("border-left-width"))||0;
W.width=V.width();
W.height=V.height();
return W
},U=function(){var Y=H.orig?A(H.orig):false,X={},W,V;
if(Y&&Y.length){W=x(Y);
X={width:(W.width+(F.padding*2)),height:(W.height+(F.padding*2)),top:(W.top-F.padding-C),left:(W.left-F.padding-C)}
}else{V=E();
X={width:1,height:1,top:V[3]+V[1]*0.5,left:V[2]+V[0]*0.5}
}return X
},u=function(){S.hide();
if(K.is(":visible")&&A.isFunction(F.onCleanup)){if(F.onCleanup(y,e,F)===false){A.event.trigger("fancybox-cancel");
O=false;
return
}}y=h;
e=D;
F=H;
w.get(0).scrollTop=0;
w.get(0).scrollLeft=0;
if(F.overlayShow){if(R){A("select:not(#fancybox-tmp select)").filter(function(){return this.style.visibility!=="hidden"
}).css({visibility:"hidden"}).one("fancybox-cleanup",function(){this.style.visibility="inherit"
})
}Q.css({"background-color":F.overlayColor,opacity:F.overlayOpacity}).unbind().show()
}c=b();
s();
if(K.is(":visible")){A(I.add(N).add(z)).hide();
var W=K.position(),V;
a={top:W.top,left:W.left,width:K.width(),height:K.height()};
V=(a.width==c.width&&a.height==c.height);
w.fadeOut(F.changeFade,function(){var X=function(){w.html(J.contents()).fadeIn(F.changeFade,v)
};
A.event.trigger("fancybox-change");
w.empty().css("overflow","hidden");
if(V){w.css({top:F.padding,left:F.padding,width:Math.max(c.width-(F.padding*2),1),height:Math.max(c.height-(F.padding*2)-j,1)});
X()
}else{w.css({top:F.padding,left:F.padding,width:Math.max(a.width-(F.padding*2),1),height:Math.max(a.height-(F.padding*2),1)});
t.prop=0;
A(t).animate({prop:1},{duration:F.changeSpeed,easing:F.easingChange,step:G,complete:X})
}});
return
}K.css("opacity",1);
if(F.transitionIn=="elastic"){a=U();
w.css({top:F.padding,left:F.padding,width:Math.max(a.width-(F.padding*2),1),height:Math.max(a.height-(F.padding*2),1)}).html(J.contents());
K.css(a).show();
if(F.opacity){c.opacity=0
}t.prop=0;
A(t).animate({prop:1},{duration:F.speedIn,easing:F.easingIn,step:G,complete:v})
}else{w.css({top:F.padding,left:F.padding,width:Math.max(c.width-(F.padding*2),1),height:Math.max(c.height-(F.padding*2)-j,1)}).html(J.contents());
K.css(c).fadeIn(F.transitionIn=="none"?0:F.speedIn,v)
}},r=function(){J.width(H.width);
J.height(H.height);
if(H.width=="auto"){H.width=J.width()
}if(H.height=="auto"){H.height=J.height()
}u()
},P=function(){O=true;
H.width=m.width;
H.height=m.height;
A("<img />").attr({id:"fancybox-img",src:m.src,alt:H.title}).appendTo(J);
u()
},l=function(){B();
i();
var aa=h[D],X,Y,ac,ab,W,V,Z;
H=A.extend({},A.fn.fancybox.defaults,(typeof A(aa).data("fancybox")=="undefined"?H:A(aa).data("fancybox")));
ac=aa.title||A(aa).title||H.title||"";
if(aa.nodeName&&!H.orig){H.orig=A(aa).children("img:first").length?A(aa).children("img:first"):A(aa)
}if(ac===""&&H.orig){ac=H.orig.attr("alt")
}if(aa.nodeName&&(/^(?:javascript|#)/i).test(aa.href)){X=H.href||null
}else{X=H.href||aa.href||null
}if(H.type){Y=H.type;
if(!X){X=H.content
}}else{if(H.content){Y="html"
}else{if(X){if(X.match(g)){Y="image"
}else{if(X.match(k)){Y="swf"
}else{if(A(aa).hasClass("iframe")){Y="iframe"
}else{if(X.match(/#/)){aa=X.substr(X.indexOf("#"));
Y=A(aa).length>0?"inline":"ajax"
}else{Y="ajax"
}}}}}else{Y="inline"
}}}H.type=Y;
H.href=X;
H.title=ac;
if(H.autoDimensions&&H.type!=="iframe"&&H.type!=="swf"){H.width="auto";
H.height="auto"
}if(H.modal){H.overlayShow=true;
H.hideOnOverlayClick=false;
H.hideOnContentClick=false;
H.enableEscapeButton=false;
H.showCloseButton=false
}if(A.isFunction(H.onStart)){if(H.onStart(h,D,H)===false){O=false;
return
}}J.css("padding",(C+H.padding+H.margin));
A(".fancybox-inline-tmp").unbind("fancybox-cancel").bind("fancybox-change",function(){A(this).replaceWith(w.children())
});
switch(Y){case"html":J.html(H.content);
r();
break;
case"inline":A('<div class="fancybox-inline-tmp" />').hide().insertBefore(A(aa)).bind("fancybox-cleanup",function(){A(this).replaceWith(w.children())
}).bind("fancybox-cancel",function(){A(this).replaceWith(J.children())
});
A(aa).appendTo(J);
r();
break;
case"image":O=false;
A.fancybox.showActivity();
m=new Image();
m.onerror=function(){p()
};
m.onload=function(){m.onerror=null;
m.onload=null;
P()
};
m.src=X;
break;
case"swf":ab='<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="'+H.width+'" height="'+H.height+'"><param name="movie" value="'+X+'"></param>';
W="";
A.each(H.swf,function(ad,ae){ab+='<param name="'+ad+'" value="'+ae+'"></param>';
W+=" "+ad+'="'+ae+'"'
});
ab+='<embed src="'+X+'" type="application/x-shockwave-flash" width="'+H.width+'" height="'+H.height+'"'+W+"></embed></object>";
J.html(ab);
r();
break;
case"ajax":V=X.split("#",2);
Z=H.ajax.data||{};
if(V.length>1){X=V[0];
if(typeof Z=="string"){Z+="&selector="+V[1]
}else{Z.selector=V[1]
}}O=false;
A.fancybox.showActivity();
f=A.ajax(A.extend(H.ajax,{url:X,data:Z,error:p,success:function(ae,af,ad){if(f.status==200){J.html(ae);
r()
}}}));
break;
case"iframe":A('<iframe id="fancybox-frame" name="fancybox-frame'+new Date().getTime()+'" frameborder="0" hspace="0" scrolling="'+H.scrolling+'" src="'+H.href+'"></iframe>').appendTo(J);
u();
break
}},n=function(){if(!S.is(":visible")){clearInterval(q);
return
}A("div",S).css("top",(L*-40)+"px");
L=(L+1)%12
},B=function(){if(A("#fancybox-wrap").length){return
}A("body").append(J=A('<div id="fancybox-tmp"></div>'),S=A('<div id="fancybox-loading"><div></div></div>'),Q=A('<div id="fancybox-overlay"></div>'),K=A('<div id="fancybox-wrap"></div>'));
if(!A.support.opacity){K.addClass("fancybox-ie");
S.addClass("fancybox-ie")
}d=A('<div id="fancybox-outer"></div>').append('<div class="fancy-bg" id="fancy-bg-n"></div><div class="fancy-bg" id="fancy-bg-ne"></div><div class="fancy-bg" id="fancy-bg-e"></div><div class="fancy-bg" id="fancy-bg-se"></div><div class="fancy-bg" id="fancy-bg-s"></div><div class="fancy-bg" id="fancy-bg-sw"></div><div class="fancy-bg" id="fancy-bg-w"></div><div class="fancy-bg" id="fancy-bg-nw"></div>').appendTo(K);
d.append(w=A('<div id="fancybox-inner"></div>'),I=A('<a id="fancybox-close"></a>'),N=A('<a href="javascript:;" id="fancybox-left"><span class="fancy-ico" id="fancybox-left-ico"></span></a>'),z=A('<a href="javascript:;" id="fancybox-right"><span class="fancy-ico" id="fancybox-right-ico"></span></a>'));
I.click(A.fancybox.close);
S.click(A.fancybox.cancel);
N.click(function(V){V.preventDefault();
A.fancybox.prev()
});
z.click(function(V){V.preventDefault();
A.fancybox.next()
});
if(R){Q.get(0).style.setExpression("height","document.body.scrollHeight > document.body.offsetHeight ? document.body.scrollHeight : document.body.offsetHeight + 'px'");
S.get(0).style.setExpression("top","(-20 + (document.documentElement.clientHeight ? document.documentElement.clientHeight/2 : document.body.clientHeight/2 ) + ( ignoreMe = document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop )) + 'px'");
d.prepend('<iframe id="fancybox-hide-sel-frame" src="javascript:\'\';" scrolling="no" frameborder="0" ></iframe>')
}};
A.fn.fancybox=function(V){A(this).data("fancybox",A.extend({},V,(A.metadata?A(this).metadata():{}))).unbind("click.fb").bind("click.fb",function(X){X.preventDefault();
if(O){return
}O=true;
A(this).blur();
h=[];
D=0;
var W=A(this).attr("rel")||"";
if(!W||W==""||W==="nofollow"){h.push(this)
}else{h=A("a[rel="+W+"], area[rel="+W+"]");
D=h.index(this)
}l();
return false
});
return this
};
A.fancybox=function(Y){if(O){return
}O=true;
var X=typeof arguments[1]!=="undefined"?arguments[1]:{};
h=[];
D=X.index||0;
if(A.isArray(Y)){for(var W=0,V=Y.length;
W<V;
W++){if(typeof Y[W]=="object"){A(Y[W]).data("fancybox",A.extend({},X,Y[W]))
}else{Y[W]=A({}).data("fancybox",A.extend({content:Y[W]},X))
}}h=jQuery.merge(h,Y)
}else{if(typeof Y=="object"){A(Y).data("fancybox",A.extend({},X,Y))
}else{Y=A({}).data("fancybox",A.extend({content:Y},X))
}h.push(Y)
}if(D>h.length||D<0){D=0
}l()
};
A.fancybox.staticUseSetup=function(){B()
};
A.fancybox.showActivity=function(){clearInterval(q);
S.show();
q=setInterval(n,66)
};
A.fancybox.hideActivity=function(){S.hide()
};
A.fancybox.next=function(){return A.fancybox.pos(e+1)
};
A.fancybox.prev=function(){return A.fancybox.pos(e-1)
};
A.fancybox.pos=function(V){if(O){return
}V=parseInt(V,10);
if(V>-1&&y.length>V){D=V;
l()
}if(F.cyclic&&y.length>1&&V<0){D=y.length-1;
l()
}if(F.cyclic&&y.length>1&&V>=y.length){D=0;
l()
}return
};
A.fancybox.cancel=function(){if(O){return
}O=true;
A.event.trigger("fancybox-cancel");
i();
if(H&&A.isFunction(H.onCancel)){H.onCancel(h,D,H)
}O=false
};
A.fancybox.close=function(){if(O||K.is(":hidden")){return
}O=true;
if(F&&A.isFunction(F.onCleanup)){if(F.onCleanup(y,e,F)===false){O=false;
return
}}i();
A(I.add(N).add(z)).hide();
A("#fancybox-title").remove();
K.add(w).add(Q).unbind();
A(window).unbind("resize.fb scroll.fb");
A(document).unbind("keydown.fb");
function V(){Q.fadeOut("fast");
K.hide();
A.event.trigger("fancybox-cleanup");
w.empty();
if(A.isFunction(F.onClosed)){F.onClosed(y,e,F)
}y=H=[];
e=D=0;
F=H={};
O=false
}w.css("overflow","hidden");
if(F.transitionOut=="elastic"){a=U();
var W=K.position();
c={top:W.top,left:W.left,width:K.width(),height:K.height()};
if(F.opacity){c.opacity=1
}t.prop=1;
A(t).animate({prop:0},{duration:F.speedOut,easing:F.easingOut,step:G,complete:V})
}else{K.fadeOut(F.transitionOut=="none"?0:F.speedOut,V)
}};
A.fancybox.resize=function(){var W,V;
if(O||K.is(":hidden")){return
}O=true;
W=w.wrapInner("<div style='overflow:auto'></div>").children();
V=W.height();
K.css({height:V+(F.padding*2)+j});
w.css({height:V});
W.replaceWith(W.children());
A.fancybox.center()
};
A.fancybox.center=function(){O=true;
var V=E(),W=F.margin,X={};
X.top=V[3]+((V[1]-((K.height()-j)+(C*2)))*0.5);
X.left=V[2]+((V[0]-(K.width()+(C*2)))*0.5);
X.top=Math.max(V[3]+W,X.top);
X.left=Math.max(V[2]+W,X.left);
K.css(X);
O=false
};
A.fn.fancybox.defaults={padding:10,margin:20,opacity:false,modal:false,cyclic:false,scrolling:"auto",width:560,height:340,autoScale:true,autoDimensions:true,centerOnScroll:false,ajax:{},swf:{wmode:"transparent"},hideOnOverlayClick:true,hideOnContentClick:false,overlayShow:true,overlayOpacity:0.3,overlayColor:"#666",titleShow:true,titlePosition:"outside",titleFormat:null,transitionIn:"fade",transitionOut:"fade",speedIn:300,speedOut:300,changeSpeed:300,changeFade:"fast",easingIn:"swing",easingOut:"swing",showCloseButton:true,showNavArrows:true,enableEscapeButton:true,onStart:null,onCancel:null,onComplete:null,onCleanup:null,onClosed:null}
})(jQuery);