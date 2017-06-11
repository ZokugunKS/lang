include once '../inc/string'

impl String {
	/**[md.zot]**api**
	Uppercases only the first letter of the string and downcases all the others.
	
	@function capitalize
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance capitalize').code()}}
	**/
	capitalize(): String => this.charAt(0).toUpperCase() + this.substring(1).toLowerCase()
}