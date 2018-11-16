include '../inc/function'

impl Function {
	/**[md.zot]**api**
	Returns a function that can be called no more than *count* times.
	
	@function until
	@param	{number}	count		The number of times that the function can be called
	@return {function}
	
	@example basics
		{{:dokka.get('mocha', 'function instance until').code()}}
	**/
	until(count): Function {
		let self = this
		let index = 0
		let last
		
		return func(...args) {
			return last if ++index > count
			
			return last = self**(...args)
		}
	}
}