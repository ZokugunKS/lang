include once ../inc/object

impl Object {
	/**[md.zot]**api**
	Returns the number of properties in the *object*;
	
	@function size
	@param	{object}	object	The object
	@return {number}
	@static
	
	@example basics
		{{:dokka.get('mocha', 'object size').code()}}
	**/
	static size(item: Object): Number {
		let count = 0
		
		for key of item {
			if item.hasOwnProperty(key) {
				++count
			}
		}
		
		return count
	}
}