include once {
	'../inc/number'
	'../inc/string'
}

impl String {
	/**[md.zot]**api**
	Converts the string as a float.
	
	@function toFloat
	@return {number}
	
	@example basics
		{{:dokka.get('mocha', 'string instance toFloat').code()}}
	**/
	toFloat(): Number => parseFloat(this)
}