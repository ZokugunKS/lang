include '../inc/string'

impl String {
	/**[md.zot]**api**
	Returns *true* if the string contains the *value*, *false* if not.

	@function contains
	@param	{string}	value			The value to search
	@param	{string}	[separator]		The separator
	@return {boolean}

	@example basics
		{{:dokka.get('mocha', 'string instance contains').code()}}
	**/
	contains(value: String, separator: String = ''): Boolean => separator.length ? (separator + this + separator).indexOf(separator + value + separator) > -1 : this.indexOf(value) > -1
}