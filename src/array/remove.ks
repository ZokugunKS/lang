include '../inc/array'

impl Array {
	/**[md.zot]**api**
	Remove all the elements alike the given value from the array
	
	@class Array
	@function remove
	@param	{any}	'...		The value to remove'
	@return {this}
	
	@example basics
		{{:dokka.get('mocha', 'array instance remove :one').code()}}
	**/
	remove(...items): Array {
		if items.length == 1 {
			let item = items[0]
			
			for i from this.length - 1 to 0 by -1 when this[i] == item {
				this.splice(i, 1)
			}
		}
		else {
			for item in items {
				for i from this.length - 1 to 0 by -1 when this[i] == item {
					this.splice(i, 1)
				}
			}
		}
		
		return this
	}
}