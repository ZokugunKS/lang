include {
	'../inc/dictionary'

	'../array/intersection'
}

impl Dictionary {
	/**[md.zot]**api**
	Returns an object containing the key-value pair from *object* with the key contained in *keys*.

	@function subset
	@param	{object}		item	The object
	@param	{array[string]}	keys	The keys to extract
	@return {object}
	@static

	@example basics
		{{:dokka.get('mocha', 'object subset').code()}}
	**/
	static subset(item: Dictionary, keys: Array<String>): Dictionary {
		const results = {}

		for const key in Dictionary.keys(item).intersection(keys) {
			results[key] = item[key]
		}

		return results
	}
}