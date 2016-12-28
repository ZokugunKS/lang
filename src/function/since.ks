include once ../inc/function

impl Function {
	/**[md.zot]**api**
	Returns a function that will only be run after first being called *count* times.
	
	@function since
	@param	{number}	count		The number of times
	@return {function}
	
	@example basics
		{{:dokka.get('mocha', 'function instance since').code()}}
	**/
	since(count) {
		let self = this
		let index = 0
		
		return func(...args) {
			if ++index <= count {
				return null
			}
			
			return self**(...args)
		}
	}
}