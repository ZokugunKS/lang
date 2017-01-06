include once ../inc/function

impl Function {
	/**[md.zot]**api**
	Returns a function with the context *this* as the context *this* when executed.
	
	@function wrap
	@param	{any}	[...]	The arguments to pass
	@return {function}
	
	@example basics
		{{:dokka.get('mocha', 'function instance wrap').code()}}
	**/
	wrap(...args): Function {
		let self = this
		
		return func(...newArgs) => self*$(this, ...args, ...newArgs)
	}
}