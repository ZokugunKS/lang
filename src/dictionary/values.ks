include '../inc/dictionary'

impl Dictionary {
	/**[md.zot]**api**
	Returns an array containing all the values of the *object*.

	@function values
	@param	{object}	item	The object
	@return {array}
	@static

	@example basics
		{{:dokka.get('mocha', 'object values').code()}}
	**/
	static values(item: Dictionary): Array => [value for const value of item]
}