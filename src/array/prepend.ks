include '../inc/array'

impl Array {
	/**[md.zot]**api**
	Add the values of the given array at the beginning of the array.
	
	@function prepend
	@param	{array}		'...		The array to add'
	@return {this}
	
	@example basics
		{{:dokka.get('mocha', 'array instance prepend :one').code()}}
	**/
	prepend(...items): Array {
		if items.length == 1 {
			this.unshift(...items[0])
		}
		else {
			for item in items desc {
				this.unshift(...item)
			}
		}
		
		return this
	}
}

export Array