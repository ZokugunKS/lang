include once ../inc/function

impl Function {
	/**[md.zot]**api**
	Execute the function every *time* milliseconds
	
	@function periodical
	@param	{number}	time		The time between each execution
	@param	{object}	[bind]		The *this* context
	@param	{array}		[args]		The arguments to pass
	@return {number}
	
	@example basics
		{{:dokka.get('mocha', 'function instance periodical :na').code()}}
	**/
	periodical(time, bind = null, ...args): Number => setInterval(this^$(bind, ...args), time)
}