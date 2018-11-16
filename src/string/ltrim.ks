include '../inc/string'

impl String {
	/**[md.zot]**api**
	Returns the string trimmed of the left.
	
	@function ltrim
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance ltrim').code()}}
	**/
	ltrim(): String => this.replace(/(^\s*)/g, '')
}