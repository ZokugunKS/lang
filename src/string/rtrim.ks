include once ../inc/string

impl String {
	/**[md.zot]**api**
	Returns the string trimmed of the right.
	
	@function rtrim
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance rtrim').code()}}
	**/
	rtrim(): String => this.replace(/\s+$/, '')
}