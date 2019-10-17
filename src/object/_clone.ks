include {
	'../inc/object'
}

impl Object {
	/**[md.zot]**api**
	Returns a deep clone of the given object.

	@function clone
	@param	{object}	value	The object
	@return {object}
	@static

	@example basics
		{{:dokka.get('mocha', 'object clone :object').code()}}
	**/
	static clone(value: Object): Object { // {{{
		if value.constructor.clone is Function {
			return value.constructor.clone(value)
		}
		if value.constructor.prototype.clone is Function {
			return value.clone()
		}

		const result = new value.constructor()

		for const value, key of value {
			result[key] = clone(value)
		}

		return result
	} // }}}
}