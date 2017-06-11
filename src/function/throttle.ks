include once {
	'../inc/function'
	'../inc/date'
}

impl Function {
	/**[md.zot]**api**
	Returns a function that execute the function on the first call and will execute its second call if only after *time* milliseconds.
	
	@function throttle
	@param	{number}	time	The time to wait
	@return {function}
	
	@example basics
		{{:dokka.get('mocha', 'function instance throttle').code()}}
	**/
	throttle(time, bind = null) {
		let self = this
		let last = 0
		
		return func(...args) {
			let current = Date.now()
			
			return if (current - last) < time
			
			last = current
			
			return self*$(bind, ...args)
		}
	}
}