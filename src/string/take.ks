include '../inc/string'

impl String {
	/**[md.zot]**api**
	Returns the string with only the *n* first characters.
	
	@function take
	@param	{int}		[n=1]		The number of characters to take
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance take :5').code()}}
	**/
	take(n = 1): String => this.substr(0, n)
}