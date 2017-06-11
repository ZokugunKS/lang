include once '../inc/array'

impl Array {
	/**[md.zot]**api**
	Returns a shallow copy.
	
	@class Array
	@function copy
	@return {array}
	
	@example basics
		{{:dokka.get('mocha', 'array instance copy').code()}}
	**/
	copy(): Array {
		let i = this.length
		let clone = new Array(i)
		
		while i-- {
			clone[i] = this[i]
		}
		
		return clone
	}
	/**[md.zot]**api**
	Returns a shallow copy.
	
	@function copy
	@param	{array}		item	The array to copy
	@return {array}
	@static
	**/
	static copy(item: Array): Array => item.copy()
}