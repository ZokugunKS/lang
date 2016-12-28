include once ../inc/array

impl Array {
	/**[md.zot]**api**
	Returns *true* if the index is valid for the array, *false* if not.
	
	@function isInsideIndex
	@param	{number}	index	The index to validate
	@return {boolean}
	
	@example basics
		{{:dokka.get('mocha', 'array instance isInsideIndex').code()}}
	**/
	isInsideIndex(index: Number): Boolean {
		return index >= 0 && index < this.length
	}
}