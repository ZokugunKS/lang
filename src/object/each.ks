include '../inc/object'

impl Object {
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
	static each(item, fn, bind = null) {
		for key of item {
			if item.hasOwnProperty(key) {
				fn*$(bind, item[key], key, item)
			}
		}
	}
}