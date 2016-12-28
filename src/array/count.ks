include once ../inc/array

impl Array {
	/**[md.zot]**api**
	Count the number of times *fn* returns true.
	
	@class Array
	@function count
	@param 	{function} 	fn 		The function to test for each element.
	@param 	{object} 	[bind] 	The object to use as 'this' within the function.
	@return	{number}
	
	@example basics
		{{:dokka.get('mocha', 'array instance count').code()}}
	**/
	count(fn): Number {
		let result = 0
		
		for item, index in this when fn(item, index, this) {
			++result
		}
		
		return result
	}
	count(fn, bind): Number {
		let result = 0
		
		for item, index in this when fn*$(bind, item, index, this) {
			++result
		}
		
		return result
	}
}