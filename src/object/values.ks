include once '../inc/object'

impl Object {
	/**[md.zot]**api**
	Returns an array containing all the values of the *object*.
	
	@function values
	@param	{object}	item	The object
	@return {array}
	@static
	
	@example basics
		{{:dokka.get('mocha', 'object values').code()}}
	**/
	static values(item): Array => [item[key] for key of item when item.hasOwnProperty(key)]
}