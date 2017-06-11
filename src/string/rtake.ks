include once '../inc/string'

impl String {
	/**[md.zot]**api**
	Returns the string with only the *n* last characters.
	
	@function rtake
	@param	{int}		[n=1]		The number of characters to take
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance rtake :5').code()}}
	**/
	rtake(n = 1): String => this.substr(this.length - n)
}