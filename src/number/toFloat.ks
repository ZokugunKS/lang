include once ../inc/number

impl Number {
	/**[md.zot]**api**
	Returns the number as a float.
	
	@function toFloat
	@return {number}
	
	@example basics
		{{:dokka.get('mocha', 'number instance toFloat').code()}}
	**/
	toFloat(): Number => parseFloat(this)
}