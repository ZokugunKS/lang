include '../inc/dictionary'

impl Dictionary {
	/**[md.zot]**api**
	Returns *true* if the *object* has any property, *false* if not.

	@function isEmpty
	@param	{object}	item	The object
	@return {boolean}
	@static

	@example basics
		{{:dokka.get('mocha', 'object isEmpty').code()}}
	**/
	static isEmpty(item: Dictionary?): Boolean {
		if item != null {
			for const :key of item {
				return false
			}
		}

		return true
	}
}