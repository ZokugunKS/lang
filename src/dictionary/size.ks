include '../inc/dictionary'

impl Dictionary {
	/**[md.zot]**api**
	Returns the number of properties in the *object*;

	@function size
	@param	{object}	object	The object
	@return {number}
	@static

	@example basics
		{{:dokka.get('mocha', 'object size').code()}}
	**/
	static size(item: Dictionary): Number {
		let count = 0

		for const :key of item {
			++count
		}

		return count
	}
}