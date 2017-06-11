include once '../inc/function'

impl Function {
	/**[md.zot]**api**
	Returns a function with first arguments the arguments passed to *curry()*.
	
	@function curry
	@param	{function}	fn		The function to curry
	@param	{array}		[args]	The arguments to pass in first position
	@param	{object}	[bind]	The *this* context
	@return {function}
	@static
	
	@example basics
		{{:dokka.get('mocha', 'function instance curry').code()}}
	**/
	static curry(fn, args = null, bind = null): Function => (newArgs) => fn*$(bind, ...args, ...newArgs)
}