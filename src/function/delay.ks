include '../inc/function'

impl Function {
	/**[md.zot]**api**
	Delay the execution of the function by *time* milliseconds.
	
	@function delay
	@param	{number}	time		The time to wait
	@param	{object}	[bind]		The *this* context
	@param	{array}		[args]		The arguments to pass
	@return {number}
	
	@example basics
		{{:dokka.get('mocha', 'function instance delay :na').code()}}
	**/
	delay(time, bind = null, ...args) => setTimeout(this^$(bind, ...args), time)
}