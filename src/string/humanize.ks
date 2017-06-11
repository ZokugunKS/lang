include once '../inc/string'

impl String {
	/**[md.zot]**api**
	Converts the string into a human style string.
	
	@function humanize
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance humanize').code()}}
	**/
	humanize(): String => this.replace(/([A-Z][a-z\d])/g, ' $1').replace(/([a-z\d])([A-Z])/g, '$1 $2').replace(/[-_\s]+/g, ' ')
}