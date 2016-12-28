include once ../inc/string

impl String {
	/**[md.zot]**api**
	Converts the string into a Dash-Style string.
	
	@function dasherize
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance dasherize').code()}}
	**/
	dasherize(): String => this.replace(/([A-Z])/g, '-$1').replace(/[^A-Za-z0-9]+/g, '-').toLowerCase()
}