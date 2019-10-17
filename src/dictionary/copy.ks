include '../inc/string'

impl Dictionary {
	/**[md.zot]**api**
	Returns a shallow copy of the given object.

	@function copy
	@param	{object}	item	The object
	@return {object}
	@static

	@example basics
		{{:dokka.get('mocha', 'object copy').code()}}
	**/
	static copy(item: Dictionary): Dictionary {
		let clone = {}

		for const :key of item {
			clone[key] = item[key]
		}

		return clone
	}
}