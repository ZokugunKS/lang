include once ../inc/array

impl Array {
	/**[md.zot]**api**
	Returns an array of the elements transformed by the parameter fn.
	
	@function map
	@param 	{function} 	fn 		The function to test for each element.
	@param 	{object} 	[bind] 	The object to use as 'this' within the function.
	@return	{array}
	
	@example basics
		{{:dokka.get('mocha', 'array instance map').code()}}
	**/
	map(fn, bind = null): Array {
		let results = new Array(this.length)
		
		for item, index in this {
			results[index] = fn*$(bind, item, index, this)
		}
		
		return results
	}
	/**[md.zot]**api**
	Returns an array of the elements transformed by the parameter fn.
	
	@class Array
	@function map
	@param	{array}		array			The array to traverse
	@param 	{function} 	iterator 		The function to test for each element.
	@param	{function}	[condition]
	@return	{array}
	**/
	static map(array: array, iterator: func): Array {
		let results = []
		
		for item, index in array {
			results.push(iterator(item, index))
		}
		
		return results
	}
	static map(array: array, iterator: func, condition: func): Array {
		let results = []
		
		for item, index in array {
			results.push(iterator(item, index)) if condition(item, index)
		}
		
		return results
	}
}