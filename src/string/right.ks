include '../inc/string'

impl String {
	/**[md.zot]**api**
	Returns a substring of the right most characters of the string and of length *length*.
	If *length* is negative, returns the string without the leftmosts.
	
	@function right
	@param	{number}	length The number of characters to read
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance right').code()}}
	**/
	right(length = 0): String {
		if length >= 0 {
			return this.substr(this.length - length)
		}
		else {
			return this.substr(-length)
		}
	}
}