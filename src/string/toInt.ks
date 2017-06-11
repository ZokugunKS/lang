include once {
	'../inc/number'
	'../inc/string'
}

impl String {
	/**[md.zot]**api**
	Converts the string as an integer.
	
	@function toInt
	@param	{number}	[base]		The base of the integer
	@return {number}
	
	@example basics
		{{:dokka.get('mocha', 'string instance toInt').code()}}
	**/
	toInt(base = 10): Number => parseInt(this, base)
}