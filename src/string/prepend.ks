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
		if this.length == 0 {
			return value ?? ''
		}
		else if value?.length > 0 {
			if separator.length > 0 {
				return value:String + separator + this
			}
			else {
				return value:String + this
			}
		}
		else {
			return this.valueOf()
		}
	}
}