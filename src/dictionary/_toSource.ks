include {
	'../inc/dictionary'
}

impl Dictionary {
	/**[md.zot]**api**
	Returns the representation of the *object* as javascript source.

	@function toSource
	@param	{object}	item	The object
	@return {string}
	@static

	@example basics
		{{:dokka.get('mocha', 'object toSource').code()}}
	**/
	static toSource(item: Dictionary): String { // {{{
		const sources = []

		for const value, key of item {
			sources.push('"' + key + '":' + toSource(value))
		}

		return '{' + sources.join(',') + '}'
	} // }}}
}