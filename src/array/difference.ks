include once '../inc/array'

impl Array {
	/**[md.zot]**api**
	Returns the difference between the current array and the given arrays
	
	@function difference
	@param	{array}	'...	The arrays onto to make the difference'
	@return	{array}
	**/
	difference(...args): Array {
		let result = []
		
		let arg, seen
		for value in this {
			seen = true
			
			for arg in args while seen {
				seen = false if arg.indexOf(value) == -1
			}
			
			result.push(value) unless seen
		}
		
		return result
	}
}