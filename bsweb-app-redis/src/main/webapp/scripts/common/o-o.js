function interface(name, attribute) {
    if (arguments.length != 2) {
        throw new Error("the number of the args must be 2")
    }
    this.name = name;
    this.attribute = attribute;
}
interface.ensureInherit = function() {
    try {
        if (arguments.length < 2) {
            throw new Error("the length of the args must be longer than 1");
        }
        var target = arguments[0];
        for (var i = 1; i < arguments.length; i++) {
            if (arguments[i].constructor !== interface) {
                throw new Error("must be 'interface'")
            }
            for (var j = 0; j < arguments[i].attribute.length; j++) {
                if (!target[arguments[i].attribute[j]]) {
                    throw new Error("the methods is not conducted properly");
                }
            }
        }
    } catch (e) {
        alert(e);
    }
}

//类式继承
function extend(superclass, subclass) {
    function f() { };
    f.prototype = superclass.prototype;
    subclass.prototype = new f();
    subclass.prototype.constructor = subclass;
    subclass.superclass = superclass.prototype;
    if (superclass.prototype.constructor == Object.prototype.constructor) {
        superclass.prototype.constructor = superclass;
    }

}