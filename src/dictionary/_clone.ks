include {
	'../inc/dictionary'
}

impl Dictionary {
	/**[md.zot]**api**
	Returns a deep clone of the given object.

	@function clone
	@param	{object}	item	The object
	@return {object}
	@static

	@example basics
		{{:dokka.get('mocha', 'object clone :object').code()}}
	**/
	static clone(item: Dictionary) { // {{{
		const result = {}

		for const value, key of item {
			result[key] = clone(value)
		}

		return result
	} // }}}
}