include once './keyOf'

impl Object {
	/**[md.zot]**api**
	Returns *true* if the *object* contains the given value, *false* if not.
	
	@function hasValue
	@param	{object}	item	The object
	@param	{any}		value	The value to search for
	@return {boolean}
	@static
	
	@example basics
		{{:dokka.get('mocha', 'object hasValue').code()}}
	**/
	static hasValue(item, value): Boolean => Object.keyOf(item, value) != null
}