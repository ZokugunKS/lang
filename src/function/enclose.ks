include once '../inc/function'

impl Function {
	/**[md.zot]**api**
	Returns a function enclose the function.
	
	@function enclose
	@param	{function}	enclosure	The surrounding function
	@return {function}
	
	@example basics
		{{:dokka.get('mocha', 'function instance enclose').code()}}
	**/
	enclose(enclosure): Function {
		let f = this
		return (...args) => enclosure(f, ...args)
	}
}