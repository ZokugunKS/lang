include {
	'../inc/array'
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
	equals(item?): Boolean {
		if item == null {
			return false
		}
		else if this == item {
			return true
		}
		else if item is not Array || this.length != item.length {
			return false
		}

		for value, index in this when value != item[index] {
			if value is Array {
				return false unless item[index] is Array && value:Array.equals(item[index])
			}
			else if value is Dictionary {
				return false unless item[index] is Dictionary && Dictionary.equals(value, item[index])
			}
			else {
				return false
			}
		}

		return true
	}
}