include '../inc/string'

#[if(any(trident, safari-v8))]
impl String {
	/**[md.zot]**api**
	Returns *true* if the string ends with the *value*, *false* if not.

	@function endsWith
	@param	{string}	search		The characters to be searched for at the end of this string.
	@param	{number}	[length]	If provided it is used as the length of str. If omitted, the default value is the length of the string.
	@return {boolean}

	@example basics
		{{:dokka.get('mocha', 'string instance endsWith').code()}}
	**/
	endsWith(search: String, length: Number = this.length): Boolean {
		if length > this.length {
			length = this.length
		}

		return this.substring(length - search.length, length) == search
	}
}

#[else]
disclose String {
	endsWith(search: String, length: Number = -1): Boolean
}