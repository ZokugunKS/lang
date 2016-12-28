include once ../inc/function

impl Function {
	/**[md.zot]**api**
	Returns a function that will call the function only one time.
	
	@function once
	@return {function}
	
	@example basics
		{{:dokka.get('mocha', 'function instance once').code()}}
	**/
	once(): Function {
		let self = this
		let alreadyCalled = false
		
		return func(...args) {
			return if alreadyCalled
			
			alreadyCalled = true
			
			return self**(...args)
		}
	}
}