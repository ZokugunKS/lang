include once '../inc/string'

impl String {
	/**[md.zot]**api**
	Converts the string to be safely used in a regex.
	
	@function escapeRegex
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance escapeRegex').code()}}
	**/
	escapeRegex(): String => this.replace(/[-[\]{}()*+?.,\\^$|#\s\/]/g, '\\$&')
}