include {
	'../inc/dictionary'

	'../array/intersection'
}

impl Dictionary {
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
	static some(item: Dictionary, fn: Function, bind = null): Boolean {
		for const _, key of item {
			if fn*$(bind, item[key], key) {
				return true
			}
		}

		return false
	}
}