include '../inc/number'

impl Number {
	/**[md.zot]**api**
	Execute the function *fn* *the number* times.
	
	@function repeat
	@param	{function}	fn		The function to repeat
	@param	{object}	[bind]	The *this* context
	
	@example basics
		{{:dokka.get('mocha', 'number instance repeat').code()}}
	**/
	repeat(fn: func, bind = null) {
		for i from 0 til this {
			fn*$(bind, i, this)
		}
	}
}