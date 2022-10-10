var wol=this.wol||{};
wol.treeListMenu=function(c,a,b){this.tree=a;
this.branchSelector=b||"li > span";
this.branches=[];
this.defaults={expandAll:false,collapseAll:false,ajax:false,branchLabelLink:false};
$.extend(this.defaults,c)
};
wol.treeListMenu.prototype={init:function(){var a=this;
if(!a.defaults.ajax){$(this.tree).find(this.branchSelector).each(function(){var c=$(this),b=c.is("a");
branchAnchor=b?c:c.removeAttr("class").wrap('<a href="#"></a>').parents("a"),newBranch=new wol.treeListMenu.branch(branchAnchor,a.defaults.branchLabelLink);
if(b){c.addClass("branchLabel").addClass("closed")
}else{branchAnchor.addClass("branchLabel").addClass("closed")
}newBranch.init();
a.branches.push(newBranch)
})
}else{$(this.tree).find("li > a.branchLabel").each(function(){var b=$(this).next("ol, ul");
if(b.length>0){var c=new wol.treeListMenu.branch($(this));
c.init();
a.branches.push(c)
}else{$(this).click(function(){b=$(this).next("ol, ul");
if(!b.length){var d=new wol.treeListMenu.ajax($(this));
d.init()
}return false
})
}})
}if(a.defaults.collapseAll){this.collapseAll()
}if(a.defaults.expandAll){this.expandAll()
}},collapseAll:function(){var a=this;
if(this.branches.length){$.each(this.branches,function(){this.toggle(false)
})
}else{$(this.tree).find("li > a.open").removeClass("open").addClass("closed").next("ol, ul").slideUp()
}},expandAll:function(){var a=this;
if(this.branches.length){$.each(this.branches,function(){this.toggle(true)
})
}else{$(this.tree).find("li > a.closed").removeClass("closed").addClass("open").next("ol, ul").slideUp()
}}};
wol.treeListMenu.branch=function(a,b){this.branch=a;
this.branchLabelLink=b
};
wol.treeListMenu.branch.prototype={init:function(){var a=this;
$(this.branch).click(function(){a.toggle($(this).hasClass("closed"));
return false
})
},toggle:function(b){var c=this,d=$(this.branch),a=d.parent();
if(b){d.removeClass("closed").addClass("open");
if(c.branchLabelLink){c.createBranchLabelLink($(c.branch))
}a.children("ol, ul").slideDown(function(){if(c.branchLabelLink){a.children(".branchLabelLink").show()
}})
}else{d.removeClass("open").addClass("closed");
a.children("ol, ul").slideUp(function(){if(c.branchLabelLink){a.children(".branchLabelLink").hide()
}})
}},createBranchLabelLink:function(c){var b=this,a=c.parent().find(".branchLabelLink");
if(!a.length){c.after('<a href="'+c.attr("href")+'" class="action branchLabelLink">View all</a>')
}else{a.show()
}}};
wol.treeListMenu.ajax=function(a){this.parent=a
};
wol.treeListMenu.ajax.prototype={init:function(){var a=this.parent;
if(!a.hasClass("fetching")){$.ajax({type:"GET",url:$(a).attr("href"),dataType:"html",dataFilter:function(c,b){return $.ol.cleanAJAXResponse(c)
},beforeSend:function(){$(a).removeClass("closed").addClass("fetching")
},success:function(b){$(a).after($(b).css("display","none"));
$(a).next("ol, ul").slideDown(function(){$(a).removeClass("fetching").addClass("open")
});
var d=new wol.treeListMenu.branch($(a));
d.init();
var c=new wol.treeListMenu({ajax:true,collapseAll:true},$(a).next("ol, ul"));
c.init();
wol.rightsLink.init()
},error:function(b,c,d){$(a).removeClass("fetching").addClass("closed")
}})
}}};
$(document).ready(function(){if($("#mrwBrowseByTOC").length){mrwTOCNavigator=new wol.treeListMenu({collapseAll:true},$("#browseMrw"));
mrwTOCNavigator.init()
}if($("#mrwBrowseByTopic").length){mrwTopicNavigator=new wol.treeListMenu({ajax:true},$("#browseMrw"));
mrwTopicNavigator.init()
}if($(".treeListMenu").length){var a=new wol.treeListMenu({branchLabelLink:true},$(".treeListMenu"),"li > .parent");
a.init()
}});