/*!
 * jQuery UI Autocomplete @1.8.23
 *
 * Copyright 2012, AUTHORS.txt (http://jqueryui.com/about)
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://jquery.org/license
 *
 * http://docs.jquery.com/UI/Autocomplete
 *
 * Depends:
 *	jquery.ui.core.js
 *	jquery.ui.widget.js
 *	jquery.ui.position.js
 */
(function(a,b){var c=0;
a.widget("ui.autocomplete",{options:{appendTo:"body",autoFocus:false,delay:300,minLength:1,position:{my:"left top",at:"left bottom",collision:"none"},source:null},pending:0,_create:function(){var d=this,f=this.element[0].ownerDocument,e;
this.isMultiLine=this.element.is("textarea");
this.element.addClass("ui-autocomplete-input").attr("autocomplete","off").attr({role:"textbox","aria-autocomplete":"list","aria-haspopup":"true"}).bind("keydown.autocomplete",function(g){if(d.options.disabled||d.element.propAttr("readOnly")){return
}e=false;
var h=a.ui.keyCode;
switch(g.keyCode){case h.PAGE_UP:d._move("previousPage",g);
break;
case h.PAGE_DOWN:d._move("nextPage",g);
break;
case h.UP:d._keyEvent("previous",g);
break;
case h.DOWN:d._keyEvent("next",g);
break;
case h.ENTER:case h.NUMPAD_ENTER:if(d.menu.active){e=true;
g.preventDefault()
}case h.TAB:if(!d.menu.active){return
}d.menu.select(g);
break;
case h.ESCAPE:d.element.val(d.term);
d.close(g);
break;
default:clearTimeout(d.searching);
d.searching=setTimeout(function(){if(d.term!=d.element.val()){d.selectedItem=null;
d.search(null,g)
}},d.options.delay);
break
}}).bind("keypress.autocomplete",function(g){if(e){e=false;
g.preventDefault()
}}).bind("focus.autocomplete",function(){if(d.options.disabled){return
}d.selectedItem=null;
d.previous=d.element.val()
}).bind("blur.autocomplete",function(g){if(d.options.disabled){return
}clearTimeout(d.searching);
d.closing=setTimeout(function(){d.close(g);
d._change(g)
},150)
});
this._initSource();
this.menu=a("<ul></ul>").addClass("ui-autocomplete").appendTo(a(this.options.appendTo||"body",f)[0]).mousedown(function(g){var h=d.menu.element[0];
if(!a(g.target).closest(".ui-menu-item").length){setTimeout(function(){a(document).one("mousedown",function(i){if(i.target!==d.element[0]&&i.target!==h&&!a.ui.contains(h,i.target)){d.close()
}})
},1)
}setTimeout(function(){clearTimeout(d.closing)
},13)
}).menu({focus:function(h,i){var g=i.item.data("item.autocomplete");
if(false!==d._trigger("focus",h,{item:g})){if(/^key/.test(h.originalEvent.type)){d.element.val(g.value)
}}},selected:function(i,j){var h=j.item.data("item.autocomplete"),g=d.previous;
if(d.element[0]!==f.activeElement){d.element.focus();
d.previous=g;
setTimeout(function(){d.previous=g;
d.selectedItem=h
},1)
}if(false!==d._trigger("select",i,{item:h})){d.element.val(h.value)
}d.term=d.element.val();
d.close(i);
d.selectedItem=h
},blur:function(g,h){if(d.menu.element.is(":visible")&&(d.element.val()!==d.term)){d.element.val(d.term)
}}}).zIndex(this.element.zIndex()+1).css({top:0,left:0}).hide().data("menu");
if(a.fn.bgiframe){this.menu.element.bgiframe()
}d.beforeunloadHandler=function(){d.element.removeAttr("autocomplete")
};
a(window).bind("beforeunload",d.beforeunloadHandler)
},destroy:function(){this.element.removeClass("ui-autocomplete-input").removeAttr("autocomplete").removeAttr("role").removeAttr("aria-autocomplete").removeAttr("aria-haspopup");
this.menu.element.remove();
a(window).unbind("beforeunload",this.beforeunloadHandler);
a.Widget.prototype.destroy.call(this)
},_setOption:function(d,e){a.Widget.prototype._setOption.apply(this,arguments);
if(d==="source"){this._initSource()
}if(d==="appendTo"){this.menu.element.appendTo(a(e||"body",this.element[0].ownerDocument)[0])
}if(d==="disabled"&&e&&this.xhr){this.xhr.abort()
}},_initSource:function(){var d=this,f,e;
if(a.isArray(this.options.source)){f=this.options.source;
this.source=function(h,g){g(a.ui.autocomplete.filter(f,h.term))
}
}else{if(typeof this.options.source==="string"){e=this.options.source;
this.source=function(h,g){if(d.xhr){d.xhr.abort()
}d.xhr=a.ajax({url:e,data:h,dataType:"json",success:function(j,i){g(j)
},error:function(){g([])
}})
}
}else{this.source=this.options.source
}}},search:function(e,d){e=e!=null?e:this.element.val();
this.term=this.element.val();
if(e.length<this.options.minLength){return this.close(d)
}clearTimeout(this.closing);
if(this._trigger("search",d)===false){return
}return this._search(e)
},_search:function(d){this.pending++;
this.element.addClass("ui-autocomplete-loading");
this.source({term:d},this._response())
},_response:function(){var e=this,d=++c;
return function(f){if(d===c){e.__response(f)
}e.pending--;
if(!e.pending){e.element.removeClass("ui-autocomplete-loading")
}}
},__response:function(d){if(!this.options.disabled&&d&&d.length){d=this._normalize(d);
this._suggest(d);
this._trigger("open")
}else{this.close()
}},close:function(d){clearTimeout(this.closing);
if(this.menu.element.is(":visible")){this.menu.element.hide();
this.menu.deactivate();
this._trigger("close",d)
}},_change:function(d){if(this.previous!==this.element.val()){this._trigger("change",d,{item:this.selectedItem})
}},_normalize:function(d){if(d.length&&d[0].label&&d[0].value){return d
}return a.map(d,function(e){if(typeof e==="string"){return{label:e,value:e}
}return a.extend({label:e.label||e.value,value:e.value||e.label},e)
})
},_suggest:function(d){var e=this.menu.element.empty().zIndex(this.element.zIndex()+1);
this._renderMenu(e,d);
this.menu.deactivate();
this.menu.refresh();
e.show();
this._resizeMenu();
e.position(a.extend({of:this.element},this.options.position));
if(this.options.autoFocus){this.menu.next(new a.Event("mouseover"))
}},_resizeMenu:function(){var d=this.menu.element;
d.outerWidth(Math.max(d.width("").outerWidth()+1,this.element.outerWidth()))
},_renderMenu:function(f,e){var d=this;
a.each(e,function(g,h){d._renderItem(f,h)
})
},_renderItem:function(d,e){return a("<li></li>").data("item.autocomplete",e).append(a("<a></a>").text(e.label)).appendTo(d)
},_move:function(e,d){if(!this.menu.element.is(":visible")){this.search(null,d);
return
}if(this.menu.first()&&/^previous/.test(e)||this.menu.last()&&/^next/.test(e)){this.element.val(this.term);
this.menu.deactivate();
return
}this.menu[e](d)
},widget:function(){return this.menu.element
},_keyEvent:function(e,d){if(!this.isMultiLine||this.menu.element.is(":visible")){this._move(e,d);
d.preventDefault()
}}});
a.extend(a.ui.autocomplete,{escapeRegex:function(d){return d.replace(/[-[\]{}()*+?.,\\^$|#\s]/g,"\\$&")
},filter:function(f,d){var e=new RegExp(a.ui.autocomplete.escapeRegex(d),"i");
return a.grep(f,function(g){return e.test(g.label||g.value||g)
})
}})
}(jQuery));
(function(a){a.widget("ui.menu",{_create:function(){var b=this;
this.element.addClass("ui-menu ui-widget ui-widget-content ui-corner-all").attr({role:"listbox","aria-activedescendant":"ui-active-menuitem"}).click(function(c){if(!a(c.target).closest(".ui-menu-item a").length){return
}c.preventDefault();
b.select(c)
});
this.refresh()
},refresh:function(){var c=this;
var b=this.element.children("li:not(.ui-menu-item):has(a)").addClass("ui-menu-item").attr("role","menuitem");
b.children("a").addClass("ui-corner-all").attr("tabindex",-1).mouseenter(function(d){c.activate(d,a(this).parent())
}).mouseleave(function(){c.deactivate()
})
},activate:function(e,d){this.deactivate();
if(this.hasScroll()){var f=d.offset().top-this.element.offset().top,b=this.element.scrollTop(),c=this.element.height();
if(f<0){this.element.scrollTop(b+f)
}else{if(f>=c){this.element.scrollTop(b+f-c+d.height())
}}}this.active=d.eq(0).children("a").addClass("ui-state-hover").attr("id","ui-active-menuitem").end();
this._trigger("focus",e,{item:d})
},deactivate:function(){if(!this.active){return
}this.active.children("a").removeClass("ui-state-hover").removeAttr("id");
this._trigger("blur");
this.active=null
},next:function(b){this.move("next",".ui-menu-item:first",b)
},previous:function(b){this.move("prev",".ui-menu-item:last",b)
},first:function(){return this.active&&!this.active.prevAll(".ui-menu-item").length
},last:function(){return this.active&&!this.active.nextAll(".ui-menu-item").length
},move:function(e,d,c){if(!this.active){this.activate(c,this.element.children(d));
return
}var b=this.active[e+"All"](".ui-menu-item").eq(0);
if(b.length){this.activate(c,b)
}else{this.activate(c,this.element.children(d))
}},nextPage:function(d){if(this.hasScroll()){if(!this.active||this.last()){this.activate(d,this.element.children(".ui-menu-item:first"));
return
}var e=this.active.offset().top,c=this.element.height(),b=this.element.children(".ui-menu-item").filter(function(){var f=a(this).offset().top-e-c+a(this).height();
return f<10&&f>-10
});
if(!b.length){b=this.element.children(".ui-menu-item:last")
}this.activate(d,b)
}else{this.activate(d,this.element.children(".ui-menu-item").filter(!this.active||this.last()?":first":":last"))
}},previousPage:function(d){if(this.hasScroll()){if(!this.active||this.first()){this.activate(d,this.element.children(".ui-menu-item:last"));
return
}var e=this.active.offset().top,c=this.element.height(),b=this.element.children(".ui-menu-item").filter(function(){var f=a(this).offset().top-e+c-a(this).height();
return f<10&&f>-10
});
if(!b.length){b=this.element.children(".ui-menu-item:first")
}this.activate(d,b)
}else{this.activate(d,this.element.children(".ui-menu-item").filter(!this.active||this.first()?":last":":first"))
}},hasScroll:function(){return this.element.height()<this.element[a.fn.prop?"prop":"attr"]("scrollHeight")
},select:function(b){this._trigger("selected",b,{item:this.active})
}})
}(jQuery));