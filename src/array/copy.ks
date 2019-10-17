include '../inc/array'

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
		let i := this.length
		const clone = new Array(i)

		while --i >= 0 {
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