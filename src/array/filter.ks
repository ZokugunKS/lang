include once '../inc/array'

impl Array {
	/**[md.zot]**api**
	Returns all the elements which are validating the parameter fn.
	
	@class Array
	@function filter
	@param 	{function} 	fn 		The function to test for each element.
	@param 	{object} 	[bind] 	The object to use as 'this' within the function.
	@return {array} The elements which are validating the parameter fn
	
	@example basics
		{{:dokka.get('mocha', 'array instance filter').code()}}
	**/
	filter(fn): Array => [value for value, index in this when fn(value, index, this)]
	filter(fn, bind): Array => [value for value, index in this when fn*$(bind, value, index, this)]
}