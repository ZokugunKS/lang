include once '../inc/string'

impl String {
	/**[md.zot]**api**
	Returns the string without its begin.
	
	@function drop
	@param	{int}		[n=1]		The number of character to drop
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance drop :5').code()}}
	**/
	drop(n = 1): String => this.substr(n)
}