include once ../inc/array

impl Array {
	/**[md.zot]**api**
	Replace an element by another and returns the array.
	
	@function replace
	@param 	{any}		item			The value to search for
	@param 	{any}		replacement		The value to replace with
	@param 	{boolean}	all				Flag if all the values equals to the *item* must be replaced or only the first one
	@return {this}
	
	@example basics
		{{:dokka.get('mocha', 'array instance replace').code()}}
	**/
	replace(item, replacement, all = false): Array {
		if all {
			for i from 0 til this.length {
				if this[i] == item {
					this[i] = replacement
				}
			}
		}
		else {
			for i from 0 til this.length {
				if this[i] == item {
					this[i] = replacement
					
					return this
				}
			}
		}
		
		return this
	}
}