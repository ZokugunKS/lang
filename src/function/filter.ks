include once ../inc/function

impl Function {
	/**[md.zot]**api**
	Returns a function that will execute the function only if it validates the given function.
	
	@function filter
	@param	{function}	fn		The filter function
	@param	{object}	[bind]	The *this* context
	@return {function}
	
	@example basics
		{{:dokka.get('mocha', 'function instance filter').code()}}
	**/
	filter(fn, bind?): Function {
		let self = this
		
		return func(...args) {
			if fn*$(bind, ...args) {
				return self*$(null, ...args)
			}
			else {
				return null
			}
		}
	}
}