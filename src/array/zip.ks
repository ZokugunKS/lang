include {
	'../inc/array'
	
	'./unzip'
}

impl Array {
	/**[md.zot]**api**
	Merges together the values of each of the arrays with the values at the corresponding position.
	
	@function zip
	@param	{array}		'...		The arrays'
	@return {array}
	@static
	
	@example basics
		{{:dokka.get('mocha', 'array class zip').code()}}
	**/
	static zip(...args) { // {{{
		return args.unzip()
	} // }}}
}