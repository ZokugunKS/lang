include '../inc/array'

impl Array {
	/**[md.zot]**api**
	Returns true if any element validates the parameter fn.

	@class Array
	@function any
	@param 	{function} 	fn 		The function to test for each element.
	@param 	{object} 	[bind] 	The object to use as 'this' within the function.
	@return	{boolean}

	@example basics
		{{:dokka.get('mocha', 'array instance any').code()}}
	**/
	any(fn: Function): Boolean {
		for item, index in this {
			return true if fn(item, index, this)
		}

		return false
	}
	any(fn: Function, bind: Object): Boolean {
		for item, index in this {
			return true if fn*$(bind, item, index, this)
		}

		return false
	}
}