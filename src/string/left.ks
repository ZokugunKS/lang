include once '../inc/string'

impl String {
	/**[md.zot]**api**
	Returns a substring of the left most characters of the string and of length *length*.
	If *length* is negative, returns the string without the rightmosts.
	
	@function left
	@param	{number}	length	The number of characters to read
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance left').code()}}
	**/
	left(length): String {
		if(length >= 0) {
			return this.substr(0, length)
		}
		else {
			return this.substr(0, this.length + length)
		}
	}
}