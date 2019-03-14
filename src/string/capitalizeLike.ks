include '../inc/string'

impl String {
	/**[md.zot]**api**
	Capitalizes the string only if the *sample* is capitalized.

	@function capitalizeLike
	@param	{string}	pattern		The string whose capitalization is copied onto the other string.
	@return {string}

	@example basics
		{{:dokka.get('mocha', 'string instance capitalizeLike').code()}}
	**/
	capitalizeLike(pattern: String): String {
		if pattern.match(/^[A-Z]/) {
			return this.charAt(0).toUpperCase() + this.slice(1)
		}
		else {
			return this.valueOf()
		}
	}
}