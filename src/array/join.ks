include once '../inc/array'

impl Array {
	/**[md.zot]**api**
	Returns a new array with all the values of the given arrays.
	
	@function join
	@param	{array}		'...		The arrays'
	@return {array}
	@static
	
	@example basics
		{{:dokka.get('mocha', 'array class join').code()}}
	**/
	static join(...args): Array { // {{{
		return [].concat(...args)
	} // }}}
}