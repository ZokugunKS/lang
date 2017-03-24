include once ../inc/function

impl Function {
	/**[md.zot]**api**
	Execute the function only after *time* milliseconds and only it isn't called.
	
	@function debounce
	@param	{number}	time	The time to wait
	@return {function}
	
	@example basics
		{{:dokka.get('mocha', 'function instance debounce').code()}}
	**/
	debounce(time): Function {
		let self = this
		let args = null
		let timeout
		
		return func(...ag) {
			if args == null {
				args = ag
			}
			
			clearTimeout(timeout)
			
			timeout = setTimeout(func() {
				return self*$(null, args)
			}, time)
		}
	}
}