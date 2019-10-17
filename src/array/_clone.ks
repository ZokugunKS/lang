include '../inc/array'

impl Array {
	/**[md.zot]**api**
	Returns a deep copy.

	@function clone
	@param	{array}		value	The array to clone
	@return {array}
	@static
	**/
	static clone(value: Array): Array => value.clone()

	/**[md.zot]**api**
	Returns a deep copy.

	@function clone
	@return {array}

	@example basics
		{{:dokka.get('mocha', 'array instance clone').code()}}
	**/
	clone(): Array {
		const result = new Array(this.length)

		for const i from this.length - 1 to 0 by -1 {
			result[i] = clone(this[i])
		}

		return result
	}
}