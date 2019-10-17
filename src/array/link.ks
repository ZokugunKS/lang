include {
	'../inc/array'

	'../dictionary/clone'
}

impl Array {
	/**[md.zot]**api**
	Returns an object with key-value pairs associated if the value checks the condition of the key from *filters*.

	@function link
	@param	{object[function]}	filters		The array of filtering functions
	@return {object}

	@example basics
		{{:dokka.get('mocha', 'array instance link').code()}}
	**/
	link(filters): Dictionary {
		const keys = Dictionary.clone(filters)
		const result = {}

		for const i from 0 til this.length {
			for const :key of keys when keys[key](this[i]) {
				result[key] = this[i]

				delete keys[key]

				break
			}
		}

		return result
	}
}