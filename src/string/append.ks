include once ../inc/string

impl String {
	/**[md.zot]**api**
	Append the *value* to the current string separated with *separator*
	
	@function append
	@param	{string}	value			The value to append
	@param	{string}	[separator]		The separator
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance append w/separator wo/null').code()}}
	**/
	append(value: String?, separator: String = ''): String {
		if this.length {
			if value?.length > 0 {
				return separator.length > 0 ? this + separator + value : this + value
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