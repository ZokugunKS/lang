include once {
	../inc/array
	
	../toSource
}

extern JSON

impl Array {
	/**[md.zot]**api**
	Returns the representation of the array as javascript source.
	
	@function toSource
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'array instance toSource').code()}}
	**/
	toSource(): String => JSON.stringify(this)
	/**[md.zot]**api**
	Returns the representation of the given array as javascript source.
	
	@function toSource
	@param	{array}		item	The array to serialize
	@return {string}
	@static
	
	@example basics
		{{:dokka.get('mocha', 'array class toSource').code()}}
	**/
	static toSource(item): String { // {{{
		if item.length > 0 {
			return '[' + [toSource(value) for value in item].join(',') + ']'
		}
		else {
			return '[]'
		}
	} // }}}
}