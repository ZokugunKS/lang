include './toFirstLowerCase'

impl String {
	/**[md.zot]**api**
	Converts the string into a camelCase string.

	@function camelize
	@return {string}

	@example basics
		{{:dokka.get('mocha', 'string instance camelize').code()}}
	**/
	camelize(): String => this.toFirstLowerCase().replace(/[-_\s]+(.)/g, (m, l) => l.toUpperCase())
}