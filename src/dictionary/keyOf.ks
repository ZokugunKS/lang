include '../inc/dictionary'

impl Dictionary {
	/**[md.zot]**api**
	Returns the key containing the given *value*.

	@function keyOf
	@param	{object}	object	The object
	@param	{any}		value	The value to search for
	@return {string}
	@static

	@example basics
		{{:dokka.get('mocha', 'object keyOf').code()}}
	**/
	static keyOf(item: Dictionary, value): String? {
		for const :key of item {
			if item[key] == value {
				return key
			}
		}

		return null
	}
}