include once '../inc/array'

impl Array {
	/**[md.zot]**api**
	Returns *true* if the index is invalid for the array, *false* if not.
	
	@function isOutsideIndex
	@param	{number}	index	The index to validate
	@return {boolean}
	
	@example basics
		{{:dokka.get('mocha', 'array instance isOutsideIndex').code()}}
	**/
	isOutsideIndex(index: Number): Boolean {
		return index < 0 || index >= this.length
	}
}