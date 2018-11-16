include '../inc/string'

impl String {
	/**[md.zot]**api**
	Converts the string into an Underscore_Style string.
	
	@function underscorify
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance underscorify').code()}}
	**/
	underscorify(): String => this.replace(/([a-z\d])([A-Z]+)/g, '$1_$2').replace(/[-\s]+/g, '_').toLowerCase()
}