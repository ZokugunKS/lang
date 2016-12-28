include once {
	../inc/array
	
	./from
	./remove
}

impl Array {
	/**[md.zot]**api**
	Remove all the elements alike the given values from the array
	
	@class Array
	@function without
	@param	{any}	...		The values to remove
	@return {this}
	
	@example basics
		{{:dokka.get('mocha', 'array instance without :one').code()}}
	**/
	without(...items): Array {
		if items.length == 1 {
			this.remove(...items[0])
		}
		else {
			for i from 0 til items.length {
				this.remove(...items[i])
			}
		}
		
		return this
	}
}