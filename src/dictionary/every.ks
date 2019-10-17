include '../inc/dictionary'

impl Dictionary {
	/**[md.zot]**api**
	Return *true* if all the *object*'s properties validate the function *fn*, *false* if not.

	@function every
	@param	{object}	object	The object
	@param	{function}	fn		The filtering function
	@param	{object}	bind	The *this* context
	@return {boolean}
	@static

	@example basics
		{{:dokka.get('mocha', 'object every').code()}}
	**/
	static every(item: Dictionary, fn: Function, bind = null): Boolean {
		for const :key of item {
			if !fn*$(bind, item[key], key) {
				return false
			}
		}

		return true
	}
}