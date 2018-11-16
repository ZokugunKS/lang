include '../inc/object'

impl Object {
	/**[md.zot]**api**
	Returns the key a the given *index*
	
	@function keyAt
	@param	{object}		object	The object
	@param	{int}			index	The index
	@return {string}
	@static
	
	@example basics
		{{:dokka.get('mocha', 'object keyAt').code()}}
	**/
	static keyAt(item, index): String {
		let i = -1
		for key of item {
			if item.hasOwnProperty(key) && ++i == index {
				return key
			}
		}
		
		return null
	}
}