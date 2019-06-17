include {
	'../inc/object'

	'../array/intersection'
}

impl Object {
	/**[md.zot]**api**
	Returns *true* if any property validates the function *fn*, *false* if not.

	@function some
	@param	{object}	item	The object
	@param	{function}	fn		The filtering function
	@param	{object}	[bind]	The *this* context
	@return {boolean}
	@static

	@example basics
		{{:dokka.get('mocha', 'object some').code()}}
	**/
	static some(item: Object, fn, bind = null): Boolean {
		for const :key of item {
			if item.hasOwnProperty(key) && fn*$(bind, item[key], key) {
				return true
			}
		}

		return false
	}
}