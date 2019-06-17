include '../inc/object'

impl Object {
	/**[md.zot]**api**
	Returns an object with all the *object*'s properties validating the function *fn*.

	@function filter
	@param	{object}	item	The object
	@param	{function}	fn		The filtering function
	@param	{object}	[bind]	The *this* context
	@return {object}
	@static

	@example basics
		{{:dokka.get('mocha', 'object filter').code()}}
	**/
	static filter(item, fn, bind = null): Object {
		let results = {}
		let value

		for const :key of item {
			if item.hasOwnProperty(key) && fn*$(bind, value = item[key], key, item) {
				results[key] = value
			}
		}

		return results
	}
}