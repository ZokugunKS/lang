include {
	'../inc/array'

	'../object/equals'
}

impl Array {
	/**[md.zot]**api**
	Return *true* if the given array is equal to the array, *false* if not.

	@function equals
	@param 	{any}	item	The array to compare to
	@return {boolean}

	@example basics
		{{:dokka.get('mocha', 'array instance equals :true').code()}}
	**/
	equals(item): Boolean {
		return true if this == item

		return false if item is not Array || this.length != item.length

		for value, index in this when value != item[index] {
			if value is Array {
				return false unless item[index] is Array && value:Array.equals(item[index])
			}
			else if value is Object {
				return false unless item[index] is Object && Object.equals(value, item[index])
			}
			else {
				return false
			}
		}

		return true
	}
}