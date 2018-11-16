include '../inc/array'

impl Array {
	/**[md.zot]**api**
	Erase only the last value alike the given value from the array
	
	@function remove
	@param	{any}	item	The value to remove
	@return {this}
	
	@example basics
		{{:dokka.get('mocha', 'array instance removeLastOf :f').code()}}
	**/
	removeLastOf(item): Array {
		for i from this.length - 1 to 0 by -1 {
			if this[i] == item {
				this.splice(i, 1)
				return this
			}
		}
		
		return this
	}
}