include '../inc/dictionary'

impl Dictionary {
	/**[md.zot]**api**
	Execute the function *fn* for all the properties of the *object*.

	@function each
	@param	{object}	object	The object
	@param	{function}	fn		The function
	@param	{object}	bind	The *this* context
	@static

	@example basics
		{{:dokka.get('mocha', 'object each').code()}}
	**/
	static each(item: Dictionary, fn: Function, bind = null) {
		for const :key of item {
			fn*$(bind, item[key], key, item)
		}
	}
}