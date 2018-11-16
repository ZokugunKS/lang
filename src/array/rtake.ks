include '../inc/array'

impl Array {
	/**[md.zot]**api**
	Returns a copy of the array with the *n* last values.
	
	@function rtake
	@param	{int}		[n=1]		The number of values to take
	@return {array}
	
	@example basics
		{{:dokka.get('mocha', 'array instance rtake :2').code()}}
	**/
	rtake(n = 1): Array => this.slice(this.length - n, this.length)
}