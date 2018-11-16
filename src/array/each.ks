include '../inc/array'

impl Array {
	/**[md.zot]**api**
	Iterates through the array and returns the array.
	
	@function each
	@param 	{function} 	fn 		The function to test for each element.
	@param 	{object} 	[bind] 	The object to use as 'this' within the function.
	@return {this}
	
	@example basics
		{{:dokka.get('mocha', 'array instance each').code()}}
	**/
	each(fn, bind = null): Array {
		this.forEach(fn, bind)
		
		return this
	}
}