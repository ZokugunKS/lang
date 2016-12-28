include once ../inc/function

impl Function {
	/**[md.zot]**api**
	Returns a function that will will delay the execution of the when it's called.
	
	@function temporize
	@param	{number}	time		The time to wait
	@param	{object}	[bind]		The *this* context
	@param	{array}		[args]		The arguments to pass
	@return {function}
	
	@example basics
		{{:dokka.get('mocha', 'function instance temporize :na').code()}}
	**/
	temporize(time, bind?, ...args): Function {
		let self = this
		
		return func() {
			setTimeout(self^$(bind, ...args), time)
		}
	}
}