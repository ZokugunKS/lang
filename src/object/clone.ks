include once {
	'../inc/object'
	
	'../clone'
}

impl Object {
	/**[md.zot]**api**
	Returns a deep clone of the given object.
	
	@function clone
	@param	{object}	item	The object
	@return {object}
	@static
	
	@example basics
		{{:dokka.get('mocha', 'object clone :object').code()}}
	**/
	static clone(item) { // {{{
		if item.constructor.clone is Function {
			return item.constructor.clone(item)
		}
		if item.constructor.prototype.clone is Function {
			return item.clone()
		}
		
		let result = {}
		
		for key, value of item {
			result[key] = clone(value)
		}
		
		return result
	} // }}}
}