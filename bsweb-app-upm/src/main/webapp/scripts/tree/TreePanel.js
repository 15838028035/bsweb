/**
 * 页面 JS Tree 的实现
 * Copyright (c) 2009 YaoYiLang 
 * @email  redrainyi@gmail.com
 * @datetime 2009-10-01 12:11:08
 * @version 2.2
 */

getUniqueID = function(){
	return ('_' + (new Date().getTime()) + '_' + parseInt(Math.random()*10000));
}

TreePanel = function(config){
    //alert(config.root.id);
	this.nodeHash = {};
	this.root = null;
	this._id = getUniqueID();
	this.iconPath = 'img/';
	this.clickListeners = [];
	this.element = document.createElement('div');
	this.element.className='TreePanel';
	this.container = null;
	this.focusNode = null;
	this.on=this.addListener;
	this.initialize.apply(this, arguments);
	this.switchType = 'client';
	this.ajaxAction = '';
};

TreePanel.prototype={
	initialize : function(config){
		var renderTo = config['renderTo'];
		this.container = (String.isInstance(renderTo) ? document.getElementById(renderTo) : renderTo ) || document.body;
		var handler= config['handler'];
		if(Function.isInstance(handler)){
			this.addListener('click',handler);
		}
		var iconPath = config['iconPath'];
		if(String.isInstance(iconPath)){
			this.iconPath = iconPath;
		}
		
		if(config['switchType'] != null){
			switchType = config['switchType'];
			//alert(switchType);
		}else{
            switchType ='client';			
		}
		
		ajaxAction = config['ajaxAction'];
		config.root.switchType = switchType ;
		var node = new TreeNode(config.root);
		this.setRootNode(node);
	},
	pathSeparator: "/",
	getRootNode : function(){
		return this.root;
	},
	setRootNode : function(node){
		this.root = node;
		node.ownerTree = this;
		this.registerNode(node);
		node.cascade((function(node){
			this.registerNode(node);
		}),this);
	},
	getNodeById : function(id){
		return this.nodeHash[id];
	},
	registerNode : function(node){
		this.nodeHash[node.id] = node;
	},
	unregisterNode : function(node){
		delete this.nodeHash[node.id];
	},
	render : function(){
		this.element.innerHTML = ''
		this.root.render();
		if(this.container){
			this.container.appendChild(this.element);
		}
		this.initEvent();
	},
	getIcon : function(icontype){
		return this.iconPath + this.icon[icontype]
	},
	getIconByType : function(type){
		return type;
	},
	initEvent : function(){
		var _this = this;
		this.element.onclick=function(event){
		    
			var event = event || window.event;
			var elem=(event.srcElement || event.target);
			var _type = elem['_type_'];
			if(typeof(_type) === undefined){
				return;
			}
			
			elem = elem.parentNode || elem.parentElement;
			if(_type == 'clip'){
				if(elem.indexId!=null){
					var node = _this.nodeHash[ elem.indexId ];
					
					if(node.isExpand){
						node.collapse();
					}else{
					    //Ajax userd
						if(switchType=='ajax' && !node.hasCached){
						    
	    					for(var i = node.childNodes.length; i >=0  ; i--){
	                	        node.removeChild(node.childNodes[i]);   
	                	    }
	                	    
                            var result =  
                            jQuery.ajax({
                              url:ajaxAction ,
                              data :{treeNodeId :node.attributes.id ,treeNodeName:node.attributes.text} ,
                              async:false,
                              dataType:"text"
                            }).responseText;
                            
                            var dataObj=eval("("+result+")");
                            //jQuery.each(dataObj,
                            //    function(idx,item){
                            //    	alert(item);
                            //    }
                           // );
                            //alert(dataObj.length);
                            for(var i=0; i<dataObj.length; i++)
							{
							  //alert(dataObj[i].id);
							  node.appendChild(new TreeNode(dataObj[i]));
							}
                            
                            
                       
	            	    }
            	       /////
						node.expand();
						//node.appendChild(new TreeNode({'text':'4456'}));
					}
				}
			}else if(_type == 'icon' || _type == 'text'){
				var node = _this.nodeHash[elem.indexId];
				for(var i=0; i < _this.clickListeners.length; i++){
					_this.clickListeners[i](node);
				}
				_this.setFocusNode(node);
			}else if(_type == 'checked'){
				var node = _this.nodeHash[elem.indexId];
				node.onCheck();
			}
		};
	},
	
	getChecked : function(name){
		var checkeds = [];
		name = name||'id';
		for(var k in this.nodeHash){
			var node = this.nodeHash[k];
			if(node.checked==1){
				var value = node.attributes[name]
				if(value != null){
					checkeds.push(value);
				}
			}
		}
		return checkeds;
	},
	
	getCheckedWhichAttrEqualValue : function(name,attrName,equValue){
		var checkeds = [];
		name = name||'id';
		for(var k in this.nodeHash){
			var node = this.nodeHash[k];
			if(node.checked==1){
				var value = node.attributes[name]
				var attrValue = node.attributes[attrName];
				if(value != null && attrValue == equValue){
					checkeds.push(value);
				}
			}
		}
		return checkeds;
	},
	
	getCheckedAndHalfChecked : function(name){
		var checkeds = [];
		name = name||'id';
		for(var k in this.nodeHash){
			var node = this.nodeHash[k];
			if(node.checked==1 || node.checked==2){
				var value = node.attributes[name]
				if(value != null){
					checkeds.push(value);
				}
			}
		}
		return checkeds;
	},
	
	addListener : function(type,handler){
		if(Function.isInstance(type)){
			handler=type;
			type === 'click'
		}
		this.clickListeners.push(handler);	
	},
	setFocusNode : function(node){
		if(this.focusNode){
			this.focusNode.unselect();
		}
		this.focusNode = node;
		if(node.parentNode){
			node.parentNode.expand();
		}
		node.select();
	},
	toString : function(){
		return "[Tree"+(this.id?" "+this.id:"")+"]";
	},
	collapseAll : function(){
		if(this.root){
			this.root.collapseChildNodes(true);
		}
	},
	expandAll : function(){
		if(this.root){
			this.root.expand(true);
		}
	},
	expandAll2 : function(){
		if(this.root){
			this.root.expand2(true);
		}
	}
};

TreePanel.prototype.icon = {
	root				: 'root.gif',
	folder			: 'folder.gif',
	folderOpen	: 'folderopen.gif',
	node				: 'page.gif',
	empty				: 'empty.gif',
	line				: 'line.gif',
	join				: 'join.gif',
	joinBottom	: 'joinbottom.gif',
	plus				: 'plus.gif',
	plusBottom	: 'plusbottom.gif',
	minus				: 'minus.gif',
	minusBottom	: 'minusbottom.gif',
	nlPlus			: 'nolines_plus.gif',
	nlMinus			: 'nolines_minus.gif',
	checkbox0		:	'checkbox_0.gif',
	checkbox1		:	'checkbox_1.gif',
	checkbox2		:	'checkbox_2.gif',
	org					: 'org.gif',
	edp					: 'edp.gif',
	emp					: 'emp.gif'
};


TreeNode=function(attributes) {
	this['attributes'] = attributes || {};
	this['html-element'] = false;//null
	if(!attributes.id){
		attributes.id = getUniqueID();
	}
	this.id = attributes.id;
	this.parentNode = null;
    this.childNodes = [];
	this.parentNode = null;
	this.lastChild = null;
	this.firstChild = null;
	this.previousSibling = null;
	this.nextSibling = null;
	this.childrenRendered = false
	this.isExpand = false;

   //
    this.switchType= attributes['switchType'] == null ? 'client' : attributes['switchType'];
    
    /////
    this.hasCached = false ;

	this.checked = this['attributes']['checked'];
	this.checked = this.checked==null ? false : this.checked;

	this.leaf = this.attributes.leaf;
	var children = attributes.children || [];
	for(var i=0,j=children.length;i<j;i++){
		var node = new TreeNode(children[i]);
		this.appendChild(node);
	}
}

TreeNode.prototype={
	initEl : function(){
		this['html-element']={};
		this['html-element']['element'] = document.createElement('div');
		this['html-element']['line']	 = document.createElement('span');
		this['html-element']['clip']	 = document.createElement('img');
		this['html-element']['icon']	 = document.createElement('img');
		this['html-element']['text']	 = document.createElement('span');
 		this['html-element']['checkbox'] = document.createElement('img');
		this['html-element']['child'] = document.createElement('div');
		this['html-element']['element'].appendChild(this['html-element']['line']);
		this['html-element']['element'].appendChild(this['html-element']['clip']);
		this['html-element']['element'].appendChild(this['html-element']['icon']);
		this['html-element']['element'].appendChild(this['html-element']['checkbox']);	
		this['html-element']['element'].appendChild(this['html-element']['text']);
		this['html-element']['element'].appendChild(this['html-element']['child']);
		this['html-element']['text'].className='TreeNode'
		this['html-element']['element'].noWrap='true';
		this['html-element']['line']['_type_'] ='line';
		this['html-element']['clip']['_type_'] ='clip';
		this['html-element']['icon']['_type_'] ='icon';
		this['html-element']['text']['_type_'] ='text';
		this['html-element']['checkbox']['_type_'] ='checked';
		this['html-element']['child'].style.display='none';
		if(this.checked===false){
			this['html-element']['checkbox'].style.display='none';
		}
	},
	render : function(){
		if(!this['html-element']){
			this.initEl();
		}
		if(this.isRoot()){
			this.ownerTree.element.appendChild(this['html-element']['element']);
			this.expand();
		}else{
			this.parentNode['html-element']['child'].appendChild(this['html-element']['element']);
		}
		this.paintPrefix();
		this['html-element']['element'].indexId = this.id;
	},
	paintPrefix : function(){
		this.paintLine();
		this.paintClipIcoImg();
		this.paintCheckboxImg();
		this.paintIconImg();
		this.paintText();
	},
	paintLine : function(){
		var ownerTree = this.getOwnerTree();
		this['html-element']['line'].innerHTML = '';
		var pathNodes = this.getPathNodes();
		for(var i = 1 ,count = pathNodes.length-1 ; i < count ; i++){
				var node = pathNodes[i];
				var img = document.createElement('img');
				if( node.isLast()){
					img.src = ownerTree.getIcon('empty');
				}else{
					img.src = ownerTree.getIcon('line');
				}
				this['html-element']['line'].appendChild(img);
		}
	},
	paintClipIcoImg : function(){
		if(this.isRoot()){
			this['html-element']['clip'].style.display='none';//不显示根节点的clip
			return;
		}
		var ownerTree = this.getOwnerTree();
		var icon = 'empty';
		if(this.isRoot()){
			icon = this.isExpand ? 'nlMinus':'nlPlus';
		}else{
			if(this.isLeaf()){ //是叶节点
				if(this.isLast()){
					icon = 'joinBottom';
				}else{
					icon = 'join';
				}
			}else{ //非叶节点
				if(this.isExpand){ //展开
					if(this.isLast()){
						icon = 'minusBottom';
					}else{
						icon = 'minus';
					}
				}else{ //折叠
					if(this.isLast()){
						icon = 'plusBottom';
					}else{
						icon = 'plus';
					}
				}
			}
		};
		this['html-element']['clip'].src = ownerTree.getIcon(icon);
	},
	paintIconImg : function(){
		var ownerTree = this.getOwnerTree();
		var icon = this['attributes']['icon'];
		if(!icon){
			var type = this['attributes']['type']
			if(type){
				icon = ownerTree.getIconByType(type);
			}
			if(!icon){
				if(this.isRoot()){
					icon = 'root';
				}else if(this.isLeaf()){
					icon = 'node';
				}else if(this.isExpand){
					icon = 'folderOpen';
				}else{
					icon = 'folder';
				}
			}
		}
		this['html-element']['icon'].src = ownerTree.getIcon(icon);
	},
	paintCheckboxImg : function(){
		var ownerTree = this.getOwnerTree();
		var checked = this.checked;
		if(this['html-element']){
			this['html-element']['checkbox'].src = ownerTree.getIcon(((checked==2)?'checkbox2':(checked==1)?'checkbox1':'checkbox0'));
		}
	},	
	paintText : function(){
		var text = 	this['attributes']['text'];
		this['html-element']['text'].style.cursor='hand'
		this['html-element']['text'].title=text;
		
		var tmp = text;
		var displaylength  = 30;
		if(text != "" && text != null){
			if(text.length > displaylength){
				tmp = text.substring(0, displaylength) + "...";
			}
		}
		
		this['html-element']['text'].innerText=tmp;
		this['html-element']['text'].textContent=text;
	},
	paintChildren : function(){
		if(!this.childrenRendered){
			this['html-element']['child'].innerHTML = '';
			this.childrenRendered = true;
			var childNodes = this.childNodes;
			for(var i=0;i < childNodes.length;i++){
				childNodes[i].render();
			}
		};
	},
	collapse : function(deep){
		this.isExpand=false;
		this['html-element']['child'].style.display='none';
		this.paintIconImg();
		this.paintClipIcoImg();
		if(deep){
			this.collapseChildNodes(deep);
		}
	},
	collapseChildNodes : function(deep){
		var cs = this.childNodes;
		for(var i = 0, len = cs.length; i < len; i++) {
			cs[i].collapse(deep);
		}
	},
	expand : function(deep){
		
		if(!this.isLeaf()&&this.childNodes.length>0){
			this.isExpand=true;
			
			
			this.paintChildren();
			this['html-element']['child'].style.display='block';
		}
		if(switchType == 'ajax'){
            this.hasCached = true ;
        }
		
		this.paintIconImg();
		this.paintClipIcoImg();
		if(deep){
			this.expandChildNodes(deep);
		}
	},
	expandChildNodes : function(deep){
		var cs = this.childNodes;
		for(var i = 0, len = cs.length; i < len; i++) {
			cs[i].expand(deep);
		}
	},
	expand2 : function(deep){
		if(!this.isLeaf()&&this.childNodes.length>0){
			this.isExpand=true;
			
			
			this.paintChildren();
			this['html-element']['child'].style.display='block';
		}
		this.hasCached = false;
		
		this.paintIconImg();
		this.paintClipIcoImg();
		if(deep){
			this.expandChildNodes2(deep);
		}
	},
	expandChildNodes2 : function(deep){
		var cs = this.childNodes;
		for(var i = 0, len = cs.length; i < len; i++) {
			cs[i].expand2(deep);
		}
	},
	select : function(){
		this.isSelect = true;
		this['html-element']['text'].style.backgroundColor='#CCCCFF';
	},
	unselect : function(){
		this.isSelect = false;
		this['html-element']['text'].style.backgroundColor='';
	},
	getEl :  function(){
		return this['html-element'];
	},
	setCheck : function(checked){
		if(checked==2||checked==3){
			var childNodes = this.childNodes;
			var count = childNodes.length;
			if(count==0){
				this.checked=checked==2?0:1;
			}else{
				var checked1 = 0;
				var checked2 = 0;
				for(var i=0;i<count;i++){
				var checked = childNodes[i].checked;
					if(checked==1){
						checked1++;
					}else if(checked==2){
						checked2++;
					}
				}
				this.checked = (childNodes.length==checked1) ? 1 : (checked1>0||checked2>0) ? 2 : 0;
			}
		}else{
			this.checked=checked;
		}
		this.paintCheckboxImg();
	},
	onCheck : function(){
		if(this.checked!==false){
			if(this.checked==1){
				this.cascade((function(checked){
					this.setCheck(checked);
				}),null,0);
				this.bubble((function(checked){
					this.setCheck(checked);
				}),null,2);
			}else{
				this.cascade((function(checked){
					this.setCheck(checked);
				}),null,1);
				this.bubble((function(checked){
					this.setCheck(checked);
				}),null,3);
			}
		}
	},

	isRoot : function(){
		return (this.ownerTree!=null) && (this.ownerTree.root === this);
	},
	isLeaf : function(){
	    //alert("isleaf , "+this.childNodes.length + (this.childNodes.length == 0));
	    if(this.childNodes.length===0){
	    	if(switchType == 'ajax'){
	    		return this.hasCached;
	    	}else{
	    		return true ;
	    	}

	    }else{
	        return false ;
	    }
		
  },
	isLast : function(){
		return (!this.parentNode ? true : this.parentNode.lastChild == this);
	},
	isFirst : function(){
		return (!this.parentNode ? true : this.parentNode.firstChild == this);
	},
	hasChildNodes : function(){
		return !this.isLeaf() && this.childNodes.length > 0;
		//return true ;
	},
	// private
	setFirstChild : function(node){
		this.firstChild = node;
	},
	//private
	setLastChild : function(node){
		this.lastChild = node;
	},
	appendChild : function(node){
		var multi = false;
		if(Array.isInstance(node)){
			multi = node;
		}else if(arguments.length > 1){
			multi = arguments;
		}
		if(multi){
    	for(var i = 0, len = multi.length; i < len; i++) {
				this.appendChild(multi[i]);
			}
		}else{
			//>>beforeappend
      var oldParent = node.parentNode;
      //>>beforemove
      if(oldParent){
				oldParent.removeChild(node);
			}
			var index = this.childNodes.length;
      if(index == 0){
				this.setFirstChild(node);
      }
			this.childNodes.push(node);
			node.parentNode = this;
			//
			var ps = this.childNodes[index-1];
			if(ps){
				node.previousSibling = ps;
				ps.nextSibling = node;
			}else{
				node.previousSibling = null;
			}
			node.nextSibling = null;
      this.setLastChild(node);
			node.setOwnerTree(this.getOwnerTree());
			//>>append
			//if(oldParent) >>move

			if(node && this.childrenRendered){
				node.render();
				if(node.previousSibling){
					node.previousSibling.paintPrefix();//paintLine();
				}
      }
      if(this['html-element']){
      	this.paintPrefix();
      }
			return node;//true
		}
	},
	removeChild : function(node){
	  var index = this.childNodes.indexOf(node);
	  if(index == -1){
	      return false;
	  }
		//>>beforeremove
		this.childNodes.splice(index, 1);
		if(node.previousSibling){
	  	node.previousSibling.nextSibling = node.nextSibling;
		}
		if(node.nextSibling){
	  	node.nextSibling.previousSibling = node.previousSibling;
		}
		if(this.firstChild == node){
	  	this.setFirstChild(node.nextSibling);
		}
		if(this.lastChild == node){
	  	this.setLastChild(node.previousSibling);
		}
		node.setOwnerTree(null);
		//clear
		node.parentNode = null;
		node.previousSibling = null;
		node.nextSibling = null;
		//>>remove UI
		if(this.childrenRendered){
			if(node['html-element']&&node['html-element']['element']){
				this['html-element']['child'].removeChild(node['html-element']['element'])	
			}
			if(this.childNodes.length==0){
				this.collapse();
			}
    }
    if(this['html-element']){
    	this.paintPrefix();
    }
		return node;
	},
	insertBefore : function(node, refNode){
		if(!refNode){
			return this.appendChild(node);
		}
		//移动位置是自身位置(不需要移动)
		if(node == refNode){
			return false;
		}
		var index = this.childNodes.indexOf(refNode);
		var oldParent = node.parentNode;
		var refIndex = index;
		//是子节点，并且是向后移动
		if(oldParent == this && this.childNodes.indexOf(node) < index){
			refIndex--;
		}
		if(oldParent){
			oldParent.removeChild(node);
		}
		//设置节点间关系
		if(refIndex == 0){
			this.setFirstChild(node);
		}
		this.childNodes.splice(refIndex, 0, node);
		node.parentNode = this;
		var ps = this.childNodes[refIndex-1];
		if(ps){
			node.previousSibling = ps;
			ps.nextSibling = node;
		}else{
			node.previousSibling = null;
		}
		node.nextSibling = refNode;
		refNode.previousSibling = node;
		node.setOwnerTree(this.getOwnerTree());
		return node;
	},
	replaceChild : function(newChild, oldChild){
		this.insertBefore(newChild, oldChild);
		this.removeChild(oldChild);
		return oldChild;
	},
	indexOf : function(child){
		return this.childNodes.indexOf(child);
	},
	getOwnerTree : function(){
		if(!this.ownerTree){
			var p = this;
			while(p){
				if(p.ownerTree){
					this.ownerTree = p.ownerTree;
					break;
				}
				p = p.parentNode;
			}
		}
		return this.ownerTree;
	},
	//获得节点深度
	getDepth : function(){
  	var depth = 0;
		var p = this;
		while(p.parentNode){
			depth++;
			p = p.parentNode;
		}
		return depth;
	},
  //private
	setOwnerTree : function(tree){
		if(tree != this.ownerTree){
			if(this.ownerTree){
				this.ownerTree.unregisterNode(this);
			}
			this.ownerTree = tree;
			var cs = this.childNodes;
			for(var i = 0, len = cs.length; i < len; i++) {
				cs[i].setOwnerTree(tree);
			}
			if(tree){
				tree.registerNode(this);
			}
		}
	},
	getPathNodes : function(){
		var nodes = [];
		for(var parent=this; parent!=null; parent=parent.parentNode){nodes.push(parent);};
		return nodes.reverse();
	},
	getPath : function(attr){
		attr = attr || "id";
		var p = this.parentNode;
		var b = [this['attributes'][attr]];
		while(p){
			b.unshift(p.attributes[attr]);
			p = p.parentNode;
    }
		var sep = this.getOwnerTree().pathSeparator;
		return sep + b.join(sep);
	},
	//冒泡(遍历所有父节点)
	bubble : function(fn, scope, args){
  	var p = this;
		while(p){
			if(fn.call(scope || p, (args==null)?p:args) === false){
	    	break;
			}
	    p = p.parentNode;
		}
	},
	//瀑布(遍历所有子节点)
	cascade : function(fn, scope, args){
		if(fn.call(scope || this, (args==null)?this:args) !== false){
			var cs = this.childNodes;
			for(var i = 0, len = cs.length; i < len; i++) {
				cs[i].cascade(fn, scope, args);
			}
    }
	},
	//查找
	findChild : function(attribute, value){
		var cs = this.childNodes;
    for(var i = 0, len = cs.length; i < len; i++) {
			if(cs[i].attributes[attribute] == value){
      return cs[i];
     }
		}
		return null;
	},
  findChildBy : function(fn, scope){
      var cs = this.childNodes;
      for(var i = 0, len = cs.length; i < len; i++) {
      	if(fn.call(scope||cs[i], cs[i]) === true){
      	    return cs[i];
      	}
      }
      return null;
  },
  //该方法未完全实现
	sort : function(fn, scope){
		var cs = this.childNodes;
		var len = cs.length;
    if(len > 0){
			var sortFn = scope ? function(){fn.apply(scope, arguments);} : fn;
			cs.sort(sortFn);
			for(var i = 0; i < len; i++){
				var n = cs[i];
        n.previousSibling = cs[i-1];
        n.nextSibling = cs[i+1];
        if(i == 0){
        	this.setFirstChild(n);
         }
        if(i == len-1){
         	this.setLastChild(n);
				}
			}
		}
	},
  contains : function(node){
     var p = node.parentNode;
      while(p){
          if(p == this){
              return true;
          }
          p = p.parentNode;
      }
      return false;
  },
  toString : function(){
      return "[Node"+(this.id?" "+this.id:"")+"]";
  }
};