include once ../inc/string

impl String {
	/**[md.zot]**api**
	Removes all duplicate spaces.
	
	@function clean
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance clean').code()}}
	**/
	clean(): String => this.replace(/\s+/g, ' ').trim()
}