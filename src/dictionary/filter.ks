include '../inc/dictionary'

impl Dictionary {
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
	static filter(item: Dictionary, fn: Function, bind = null): Dictionary {
		const results = {}

		for const value, key of item {
			if fn*$(bind, value, key, item) {
				results[key] = value
			}
		}

		return results
	}
}