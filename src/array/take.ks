include once '../inc/array'

impl Array {
	/**[md.zot]**api**
	Returns a copy of the array with the *n* first values.
	
	@function take
	@param	{int}		[n=1]		The number of values to take
	@return {array}
	
	@example basics
		{{:dokka.get('mocha', 'array instance take :2').code()}}
	**/
	take(n = 1): Array => this.slice(0, n)
}