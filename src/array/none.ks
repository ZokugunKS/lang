include once ../inc/array

impl Array {
	/**[md.zot]**api**
	Returns true if none of the elements validate the parameter fn.
	
	@function none
	@param 	{function} 	fn 		The function to test for each element.
	@param 	{object} 	[bind] 	The object to use as 'this' within the function.
	@return	{boolean}
	
	@example basics
		{{:dokka.get('mocha', 'array instance none').code()}}
	**/
	none(fn, bind = null): Boolean {
		for item, i in this {
			return false if fn*$(bind, item, i, this)
		}
		
		return true
	}
}

export Array