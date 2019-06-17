include '../inc/object'

impl Object {
	/**[md.zot]**api**
	Returns the value a the given *index*

	@function value
	@param	{object}		object	The object
	@param	{int}			index	The index
	@return {any}
	@static

	@example basics
		{{:dokka.get('mocha', 'object value').code()}}
	**/
	static value(item, index) {
		let  i = -1

		for const :key of item {
			if ++i == index {
				return item[key]
			}
		}

		return null
	}
}