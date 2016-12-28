include once ../inc/string

impl String {
	/**[md.zot]**api**
	Returns a string compose of the string repated *n* times.
	
	@function repeat
	@param	{number} 	n	N times
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance repeat').code()}}
	**/
	repeat(n): String {
		let result = ''
		let pattern = this
		
		while n > 0  {
			if n & 1 {
				result += pattern
			}
			
			n >>= 1
			
			pattern += pattern
		}
		
		return result
	}
}