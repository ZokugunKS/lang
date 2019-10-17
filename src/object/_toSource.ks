include '../inc/object'

impl Object {
	/**[md.zot]**api**
	Returns the representation of the *object* as javascript source.

	@function toSource
	@param	{object}	item	The object
	@return {string}
	@static

	@example basics
		{{:dokka.get('mocha', 'object toSource').code()}}
	**/
	static toSource(value: Object): String { // {{{
		if value.constructor.toSource is Function {
			return value.constructor.toSource(value)
		}
		if value.constructor.prototype.toSource is Function {
			return value.toSource()
		}

		let sources = []

		for const value, key of value when value.hasOwnProperty(key) {
			sources.push('"' + key + '":' + toSource(value))
		}

		return '{' + sources.join(',') + '}'
	} // }}}
}