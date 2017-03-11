



var Util = (function() {

    var o = {
        //取得浏览器类型和版本信息
        getUserAgent: navigator.userAgent,
        isGecko: function() { return Util.getUserAgent.indexOf("Gecko") != -1 },
        isOpera: function() { return Util.getUserAgent.indexOf("Opera") != -1 },
        //取得横向或者纵向相对于浏览器边界偏移量，用于确定某个元素相对于边界的绝对位置
        getOffset: function(el, isLeft) {
            var retValue = 0;
            while (el != null) {
                retValue += el["offset" + (isLeft ? "Left" : "Top")];
                el = el.offsetParent;
            }
            return retValue;
        },
        //绑定函数
        bindFunction: function(el, fucName) {
            return function() {
                return el[fucName].apply(el, arguments);
            };
        }
    };
    return o;

})();

function LayOut(root, options) {
    this.root = document.getElementById(root);
    this.dragArray = [];
    this.setOption(options);
    this.widget_class = this.options.widget_class;
    this.header_style = this.options.header_style;
    this.find_level = this.options.find_level;
}

LayOut.prototype = {
    setOption: function(opts) {
        this.options = {
            widget_class: "widget",
            //取头部的规则
            header_style: "_h",
            //位置查找的精确度
            find_level: 100000000
        }
        for (var o in opts || {}) {
            this.options[o] = opts[o];
        }
    },
    hide: function() {

        this.root.style.display = "none";
    },

    show: function() {
        this.root.style.display = "";
    },

    ghostElement: null,

    getGhostElement: function() {
        if (!this.ghostElement) {
            this.ghostElement = document.createElement("DIV");
            this.ghostElement.className = this.widget_class;
            this.ghostElement.backgroundColor = "";
            this.ghostElement.style.border = "2px dashed #aaa";
            this.ghostElement.innerHTML = "&nbsp;";
        }
        return this.ghostElement;
    }

}


var Iscope = new interface("Iscope", ["dragArray", "hide", "show", "getGhostElement"]);


function DragElement(el, scope) {

    interface.ensureInherit(scope, Iscope);
    this.scope = scope;
    this._dragStart = start_Drag;
    this._drag = when_Drag;
    this._dragEnd = end_Drag;
    this._afterDrag = after_Drag;
    this.isDragging = false;
    this.elm = document.getElementById(el);
    this.header = document.getElementById(el + scope.options.header_style);
    this.hasIFrame = this.elm.getElementsByTagName("IFRAME").length > 0;
    if (this.header) {
        this.header.style.cursor = "move";
        Drag.init(this.header, this.elm);
        this.elm.onDragStart = Util.bindFunction(this, "_dragStart");
        this.elm.onDrag = Util.bindFunction(this, "_drag");
        this.elm.onDragEnd = Util.bindFunction(this, "_dragEnd");
    }
    this.scope.dragArray.push(this.elm);
}



function start_Drag() {

    for (var i = 0; i < this.scope.dragArray.length; i++) {
        var ele = this.scope.dragArray[i];
        ele.pagePosLeft = Util.getOffset(ele, true);
        ele.pagePosTop = Util.getOffset(ele, false);
    }
    //取得当前元素同级下一个元素
    this.origNextSibling = this.elm.nextSibling;
    var _ghostElement = this.scope.getGhostElement();
    //高度，用来设定虚线框的高
    var offH = this.elm.offsetHeight;
    if (Util.isGecko()) {
        offH -= parseInt(_ghostElement.style.borderTopWidth) * 2;
    }
    //宽度，用来设定虚线框的宽
    var offW = this.elm.offsetWidth;
    var offLeft = Util.getOffset(this.elm, true);
    var offTop = Util.getOffset(this.elm, false);
    //貌似没用
    this.scope.hide();
    this.elm.style.width = offW + "px";
    _ghostElement.style.height = offH + "px";
    //将虚线框插入到目标元素之前
    this.elm.parentNode.insertBefore(_ghostElement, this.elm.nextSibling);
    //这两条语句顺序一定不能颠倒，否则虚线框位置会错误
    this.elm.style.position = "absolute";
    this.elm.style.zIndex = 100;
    this.elm.style.left = offLeft + "px";
    this.elm.style.top = offTop + "px";
    //貌似没用
    this.scope.show();
    this.isDragging = false;
    return false;
};
//关于拖动过程的位置信息的代码，全部在这里进行维护
function when_Drag(clientX, clientY) {

    if (!this.isDragging) {
        this.elm.style.filter = "alpha(opacity=70)";
        this.elm.style.opacity = 0.7;
        this.isDragging = true;
    }

    var found = null;
    //可通过设定该值来定义查找的精确度
    var max_distance = this.scope.find_level;
    //查找算法，在当前可以被拖动的元素内查找与自己位置最接近的元素
    for (var i = 0; i < this.scope.dragArray.length; i++) {
        var ele = this.scope.dragArray[i];
        //算法
        var distance = Math.sqrt(Math.pow(clientX - ele.pagePosLeft, 2) + Math.pow(clientY - ele.pagePosTop, 2));
        //如果是自己就跳出
        if (ele == this.elm) {
            continue;
        }
        //如果不是数字跳出
        if (isNaN(distance)) {
            continue;
        }
        //找到后赋值给found
        if (distance < max_distance) {
            max_distance = distance;
            found = ele;
        }
    }


    var _ghostElement = this.scope.getGhostElement();
    //如果找到以后就执行以下操作
    if (found != null && _ghostElement.nextSibling != found) {
        //实现时时预览
        found.parentNode.insertBefore(_ghostElement, found);
        if (Util.isOpera()) {

            document.body.style.display = "none";
            document.body.style.display = "";
        }
    }
};

function end_Drag() {

    if (this._afterDrag()) {

    }
    return true;
};
//结束拖动以后
function after_Drag() {
    var returnValue = false;

    this.scope.hide();
    //把目标元素属性清空，只保留css类
    this.elm.style.position = "";
    this.elm.style.width = "";
    this.elm.style.zIndex = "";
    this.elm.style.filter = "";
    this.elm.style.opacity = "";
    var ele = this.scope.getGhostElement();
    //执行位置插入操作
    if (ele.nextSibling != this.origNextSibling) {
        ele.parentNode.insertBefore(this.elm, ele.nextSibling);
        returnValue = true;
    }
    //清除掉虚线框
    ele.parentNode.removeChild(ele);
    this.scope.show();
    if (Util.isOpera()) {
        document.body.style.display = "none";
        document.body.style.display = "";
    }
    return returnValue;
}

var Drag = {
    obj: null,
    init: function(elementHeader, element) {
        elementHeader.onmousedown = Drag.start;
        elementHeader.obj = element;
        if (isNaN(parseInt(element.style.left))) {
            element.style.left = "0px";
        }
        if (isNaN(parseInt(element.style.top))) {
            element.style.top = "0px";
        }
        element.onDragStart = new Function();
        element.onDragEnd = new Function();
        element.onDrag = new Function();
    },

    start: function(event) {
        //事件机制中this指代触发事件的元素
        var element = Drag.obj = this.obj;
        event = Drag.fixE(event);
        //必须是左键
        if (event.which != 1) {
            return true;
        }
        //触发元素本身的拖动事件
        element.onDragStart();
        element.lastMouseX = event.clientX;
        element.lastMouseY = event.clientY;
        document.onmouseup = Drag.end;
        document.onmousemove = Drag.drag;
        return false;
    },

    drag: function(event) {

        event = Drag.fixE(event);
        if (event.which == 0) {
            return Drag.end();
        }
        var element = Drag.obj;
        var _clientX = event.clientY;
        var _clientY = event.clientX;
        if (element.lastMouseX == _clientY && element.lastMouseY == _clientX) {
            return false;
        }
        var _lastX = parseInt(element.style.top);
        var _lastY = parseInt(element.style.left);
        var newX, newY;
        newX = _lastY + _clientY - element.lastMouseX;
        newY = _lastX + _clientX - element.lastMouseY;
        element.style.left = newX + "px";
        element.style.top = newY + "px";
        element.lastMouseX = _clientY;
        element.lastMouseY = _clientX;
        //触发本身的onDrag
        element.onDrag(newX, newY);
        return false;
    },

    end: function(event) {

        event = Drag.fixE(event);
        //结束后清除事件
        document.onmousemove = null;
        document.onmouseup = null;

        var _onDragEndFuc = Drag.obj.onDragEnd();
        //当前元素置位null
        Drag.obj = null;
        //执行元素本身的end事件
        return _onDragEndFuc;
    },
    //对事件进行处理
    fixE: function(ig_) {
        if (typeof ig_ == "undefined") {
            ig_ = window.event;
        }
        if (typeof ig_.layerX == "undefined") {
            ig_.layerX = ig_.offsetX;
        }
        if (typeof ig_.layerY == "undefined") {
            ig_.layerY = ig_.offsetY;
        }
        if (typeof ig_.which == "undefined") {
            ig_.which = ig_.button;
        }
        return ig_;
    }
};
