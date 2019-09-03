include '../inc/object'

impl Object {
	/**[md.zot]**api**
	Returns *true* if the *object* has any property, *false* if not.

	@function isEmpty
	@param	{object}	item	The object
	@return {boolean}
	@static

	@example basics
		{{:dokka.get('mocha', 'object isEmpty').code()}}
	**/
	static isEmpty(item?): Boolean {
		if item != null {
			for const :key of item {
				if item.hasOwnProperty(key) {
					return false
				}
			}
		}

		return true
	}
}