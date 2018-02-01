function StringBuilder(str)
{
    this.tmp = new Array();        
}
StringBuilder.prototype.Append= function(value)
{
    this.tmp.push(value);
    return this;
}
StringBuilder.prototype.Clear = function()
{
    tmp.length=1;
}
StringBuilder.prototype.toString = function()
{
    return this.tmp.join('');
}
StringBuilder.prototype.join = function(value)
{
	return this.tmp.join(value);
}