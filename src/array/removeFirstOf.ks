include once '../inc/array'

impl Array {
	/**[md.zot]**api**
	Erase only the first value alike the given value from the array
	
	@function remove
	@param	{any}	item	The value to remove
	@return {this}
	
	@example basics
		{{:dokka.get('mocha', 'array instance removeFirstOf :f').code()}}
	**/
	removeFirstOf(item): Array {
		for i from 0 til this.length {
			if this[i] == item {
				this.splice(i, 1)
				return this
			}
		}
		
		return this
	}
}