include once '../inc/array'

impl Array {
	/**[md.zot]**api**
	Returns a new array containing items from this array for which the function returns false. 
	
	@function reject
	@param 	{function} 	fn 		The grouping function
	@param 	{object} 	[bind] 	The object to use as 'this' within the function.
	@return {array}
	
	@example basics
		{{:dokka.get('mocha', 'array instance reject').code()}}
	**/
	reject(fn, bind = null): Array => [value for value, index in this when value? && !fn*$(bind, value, index, this)]
}