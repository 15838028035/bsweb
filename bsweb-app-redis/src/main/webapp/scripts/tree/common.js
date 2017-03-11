/*!
 * JavaScript 扩充 Library v1.0
 * Copyleft (^-^) 2009
 * @email    : redrainyi@gmail.com
 * @datetime : 2009-09-15 09:35:59 -050
 * @author   : yaoyilang
 * @revision : 1.1
 */
(function () {
	//for old browsers
	window["undefined"] = window["undefined"];
	//String class extend
	String.isInstance = function (_string) {
		return (typeof (_string) === "string");
	};
	String.isEmpty = function (str) {
		return (typeof (str) === "undefined" || str === null || (str.length === 0));
	};
	String.isNotEmpty = function (str) {
		return (!String.isEmpty(str));
	};
	String.prototype.trim = function () {
		return this.replace(/(^[\s]*)|([\s]*$)/g, "");
	};
	String.prototype.getAttribute = function (name) {
		var reg = new RegExp("(^|;|\\s)" + name + "\\s*:\\s*([^;]*)(\\s|;|$)", "i");
		if (reg.test(this)) {
			return RegExp.$2.replace(/[\x0f]/g, ";");
		}
		return null;
	};
	String.prototype.cnLength = function () {
		return ((this.replace(/[^x00-xFF]/g, "**")).length);
	};
	//Array class extend
	Array.isInstance = function (obj) {
		return Object.prototype.toString.call(obj) === '[object Array]';
	};
	Array.prototype.add = function (o) {
		this.push(o);
	};
	Array.prototype.indexOf = function (o) {
		for (var i = 0, len = this.length; i < len; i = i + 1) {
			if (this[i] != null && typeof(this[i].equals)=='function' && this[i].equals(o)) {
				return i;
			}
			if (this[i] == o) {
				return i;
			}
		}
		return -1;
	};
	Array.prototype.equals = function (_array) {
		if(this == _array){
			return true;
		}
		if(!Array.isInstance(_array)){
			return false;
		}
		if(this.length != _array.length){
			return false;
		}
		for (var i = 0, len = this.length; i < len; i = i + 1) {
			var o1 = this[i];
			var o2 = _array[i];
			if(o1 != o2){
				if(!(typeof(o1.equals)=='function' && o1.equals(o2))){
					return false;
				}
			}
		}
		return true;
	};	
	Array.prototype.remove = function (o) {
		var index = this.indexOf(o);
		if (index != -1) {
			this.splice(index, 1);
			return true;
		} else {
			return false;
		}
	};
	Array.prototype.contains = function (o) {
		return this.indexOf(o) != -1;
	};
	Array.prototype.containsAll = function (oArray) {
		if (this == oArray) {
			return true;
		}
		for (var i = 0; i < oArray.length; i = i + 1) {
			var o = oArray[i];
			if (!this.contains(o)) {
				return false;
			}
		}
		return true;
	};
	//Date class extend
	Date.isInstance = function (obj) {
		return	(Object.prototype.toString.call(obj) === '[object Date]');
	};
	//Function class extend
	Function.isInstance = function (obj) {
		return Object.prototype.toString.call(obj) === '[object Function]';
	};
	//Number class extend
	Number.isInstance = function (obj) {
		return Object.prototype.toString.call(obj) === '[object Number]';
	};
	//Boolean class extend
	Boolean.isInstance = function (obj) {
		return Object.prototype.toString.call(obj) === '[object Boolean]';
	};
})();