include once ../inc/string

impl String {
	/**[md.zot]**api**
	Returns the string with only the first character downcased.
	
	@function lowerFirst
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance lowerFirst').code()}}
	**/
	lowerFirst(): String => this.charAt(0).toLowerCase() + this.substring(1)
}