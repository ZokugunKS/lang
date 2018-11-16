include '../inc/string'

impl String {
	/**[md.zot]**api**
	Prepend the *value* to the current string separated with *separator*
	
	@function prepend
	@param	{string}	value			The value to prepend
	@param	{string}	[separator]		The separator
	@return {boolean}
	
	@example basics
		{{:dokka.get('mocha', 'string instance prepend w/separator wo/null').code()}}
	**/
	prepend(value: String?, separator: String = ''): String {
		if this.length {
			if value?.length > 0 {
				return separator.length > 0 ? value + separator + this : value + this
			}
			else {
				return this.valueOf()
			}
		}
		else {
			return value
		}
	}
}