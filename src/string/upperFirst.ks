include '../inc/string'

impl String {
	/**[md.zot]**api**
	Returns the string with only the first character upcased.
	
	@function upperFirst
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance upperFirst').code()}}
	**/
	upperFirst(): String => this.charAt(0).toUpperCase() + this.substring(1)
}