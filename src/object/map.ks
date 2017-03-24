include once ../inc/object

impl Object {
	/**[md.zot]**api**
	Returns an object with every *object*'s properties transformed by the function *fn*.
	
	@function map
	@param	{object}	item	The object
	@param	{function}	fn		The transform function
	@param	{object}	[bind]	The *this* context
	@return {object}
	@static
	
	@example basics
		{{:dokka.get('mocha', 'object map').code()}}
	**/
	static map(item, fn, bind = null): Object {
		let results = {}
		
		for key of item {
			if item.hasOwnProperty(key) {
				results[key] = fn*$(bind, item[key], key, item)
			}
		}
		
		return results
	}
}