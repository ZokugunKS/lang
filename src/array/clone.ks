include once {
	'../inc/array'
	
	'../clone'
}

impl Array {
	/**[md.zot]**api**
	Returns a deep copy.
	
	@function clone
	@return {array}
	
	@example basics
		{{:dokka.get('mocha', 'array instance clone').code()}}
	**/
	clone(): Array {
		let result = new Array(this.length)
		
		for i from this.length - 1 to 0 by -1 {
			result[i] = clone(this[i])
		}
		
		return result
	}
	/**[md.zot]**api**
	Returns a deep copy.
	
	@function clone
	@param	{array}		item	The array to clone
	@return {array}
	@static
	**/
	static clone(item: Array): Array => item.clone()
}