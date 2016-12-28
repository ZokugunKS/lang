include once ../inc/array

impl Array {
	/**[md.zot]**api**
	Returns the first element of the array.
	
	@function first
	@param	{number}	[index=1]	The index from first
	@return {any}
	
	@example basics
		{{:dokka.get('mocha', 'array instance first').code()}}
	**/
	first(index = 1) {
		return this.length ? this[index == 0 ? 0 : index - 1] : null
	}
}