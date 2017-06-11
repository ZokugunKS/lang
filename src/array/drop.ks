include once '../inc/array'

impl Array {
	/**[md.zot]**api**
	Returns a copy of the array without the *n* first values.
	
	@function drop
	@param	{int}		[n=1]		The number of values to drop
	@return {array}
	
	@example basics
		{{:dokka.get('mocha', 'array instance drop').code()}}
	**/
	drop(n = 1): Array {
		return this.slice(n)
	}
}