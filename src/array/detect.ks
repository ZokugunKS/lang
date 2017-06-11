include once '../inc/array'

impl Array {
	/**[md.zot]**api**
	Returns the first item from the array for which the function evaluates to true. 
	
	@class Array
	@function detect
	param 	{function} 	fn 		The function to test for each element.
	@param 	{object} 	[bind] 	The object to use as 'this' within the function.
	@return {any}
	
	@example basics
		{{:dokka.get('mocha', 'array instance detect :true').code()}}
	**/
	detect(fn) {
		for item, index in this when fn(item, index, this) {
			return item
		}
		
		return null
	}
	detect(fn, bind) {
		for item, index in this when fn*$(bind, item, index, this) {
			return item
		}
		
		return null
	}
}