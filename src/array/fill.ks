include '../inc/array'

impl Array {
	/**[md.zot]**api**
	Returns a new array of the size *length* and filled with the *value*.
	
	@function fill
	@param	{number}	length	The size of the new array
	@param	{any}		value	The value to fill with
	@return {array}
	@static
	
	@example basics
		{{:dokka.get('mocha', 'array class fill').code()}}
	**/
	static fill(length, value): Array { // {{{
		return [value for i from 0 til length]
	} // }}}
}