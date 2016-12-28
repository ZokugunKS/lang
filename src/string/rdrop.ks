include once ../inc/string

impl String {
	/**[md.zot]**api**
	Returns the string without its end.
	
	@function rdrop
	@param	{int}		[n=1]		The number of character to drop
	@return {array}
	
	@example basics
		{{:dokka.get('mocha', 'string instance rdrop :5').code()}}
	**/
	rdrop(n = 1): String => this.substr(0, this.length - n)
}