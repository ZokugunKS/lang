include once ../inc/array

impl Array {
	/**[md.zot]**api**
	Returns a copy of the array without the *n* last values.
	
	@function rdrop
	@param	{int}		[n=1]		The number of values to drop
	@return {array}
	
	@example basics
		{{:dokka.get('mocha', 'array instance rdrop').code()}}
	**/
	rdrop(n = 1): Array => this.slice(0, this.length - n)
}