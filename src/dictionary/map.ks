include '../inc/dictionary'

impl Dictionary {
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
	static map(item: Dictionary, fn: Function, bind = null): Dictionary {
		const results = {}

		for const :key of item {
			results[key] = fn*$(bind, item[key], key, item)
		}

		return results
	}
}