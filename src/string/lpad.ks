include {
	'../inc/string'
	
	'./repeat'
}

impl String {
	/**[md.zot]**api**
	Returns the string of length *length* and left padded with *pad* or space.
	
	@function lpad
	@param	{number}	length		The length of the string
	@param	{string}	[pad]		The string used to pad
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance lpad').code()}}
	**/
	lpad(length, pad: String = ' '): String => pad.repeat(length - this.length) + this
}