include once ../inc/function

extern setTimeout

impl Function {
	/**[md.zot]**api**
	Run the function asynchronously.
	
	@function async
	@param	{object}	[bind]		The *this* context
	@param	{array}		[args]		The arguments to pass
	
	@example basics
		{{:dokka.get('mocha', 'function instance async').code()}}
	**/
	async(bind?, ...args) {
		setTimeout(this^$(bind, ...args), 1)
	}
}