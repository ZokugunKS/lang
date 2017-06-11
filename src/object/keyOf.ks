include once '../inc/object'

impl Object {
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
	static keyOf(item, value): String {
		for key of item {
			if item.hasOwnProperty(key) && item[key] == value {
				return key
			}
		}
		
		return null
	}
}