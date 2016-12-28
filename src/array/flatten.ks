include once ../inc/array

impl Array {
	/**[md.zot]**api**
	Returns a flattened copy the array.
	
	@function flatten
	@return {array}
	
	@example basics
		{{:dokka.get('mocha', 'array instance flatten').code()}}
	**/
	flatten(): Array {
		let result = []
		
		for value, index in this {
			if value is Array {
				result.push(...value:Array.flatten())
			}
			else if value? {
				result.push(value)
			}
		}
		
		return result
	}
}