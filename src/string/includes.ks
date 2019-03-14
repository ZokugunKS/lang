include '../inc/string'

#[if(any(jsc-v8, trident))]
impl String {
	/**[md]**api**
	Returns *true* if `search` is found within the string.

	@function includes
	@param	{string}	search		A string to be searched for within this string.
	@param	{number}	[position]	The position within the string at which to begin searching for `search`. (defaults to 0).
	@return {boolean}
	**/
	includes(search: String, position: Number = 0): Boolean {
		if position + search.length > this.length {
			return false
		}
		else {
			return this.indexOf(search, position) != -1
		}
	}
}

#[else]
disclose String {
	includes(search: String, position: Number = 0): Boolean
}