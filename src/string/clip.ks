include once '../inc/string'

impl String {
	/**[md.zot]**api**
	Returns the string clipped of its start and end.
	
	@function clip
	@param	{number}	[start=0]		the offset from the start of the string
	@param	{number}	[end=0]			the offset from the end of the string
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance clip :2:2').code()}}
	**/
	clip(start = 0, end = 0): String => this.slice(start, this.length - end)
}