include once {
	../inc/string
	
	./repeat
}

impl String {
	/**[md.zot]**api**
	Returns the string of length *length* and right padded with *pad* or space.
	
	@function rpad
	@param	{number}	length		The length of the string
	@param	{string}	[pad]		The string used to pad
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance rpad').code()}}
	**/
	rpad(length, pad: String = ' '): String => this + pad.repeat(length - this.length)
}