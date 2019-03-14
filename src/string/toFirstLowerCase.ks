include '../inc/string'

impl String {
	/**[md.zot]**api**
	Returns the string with only the first character downcased.

	@function toFirstLowerCase
	@return {string}

	@example basics
		{{:dokka.get('mocha', 'string instance toFirstLowerCase').code()}}
	**/
	toFirstLowerCase(): String => this.charAt(0).toLowerCase() + this.substring(1)
}