include once '../inc/function'

impl Function {
	/**[md.zot]**api**
	Repeat the given function *n* times.
	
	@function repeat
	@param	{function}	fn	The function to repeat
	@param	{number}	n	N times
	@static
	
	@example basics
		{{:dokka.get('mocha', 'function class repeat').code()}}
	**/
	static repeat(fn, n) {
		for i from 0 til n {
			fn(i)
		}
	}
}