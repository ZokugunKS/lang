include './capitalizeWords'

impl String {
	/**[md.zot]**api**
	Converts the string into a ClassCase string.
	
	@function classify
	@return {string}
	
	@example basics
		{{:dokka.get('mocha', 'string instance classify').code()}}
	**/
	classify(): String => this.replace(/[-_]/g, ' ').replace(/([A-Z])/g, ' $1').capitalizeWords().replace(/\s/g, '')
}