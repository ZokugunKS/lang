include '../inc/string'

#[if(any(trident, safari-v8))]
impl String {
	/**[md.zot]**api**
	Returns *true* if the string starts with the *value*, *false* if not.

	@function startsWith
	@param	{string}	search		The characters to be searched for at the start of this string.
	@param	{number}	[position]	The position in this string at which to begin searching for `search`; defaults to 0.
	@return {boolean}

	@example basics
		{{:dokka.get('mocha', 'string instance startsWith').code()}}
	**/
	startsWith(search: String, position: Number = 0): Boolean {
		if position < 0 {
			position = 0
		}

		return this.substring(position, position + search.length) == search
	}
}

#[else]
disclose String {
	startsWith(search: String, position: Number = 0): Boolean
}