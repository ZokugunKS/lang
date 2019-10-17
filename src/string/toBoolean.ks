include './toBooleanOrNull'

impl String {
	/**[md.zot]**api**
	Converts the string as a boolean.

	@function toBoolean
	@return {boolean}

	@example basics
		{{:dokka.get('mocha', 'string instance toBoolean').code()}}
	**/
	toBoolean(): Boolean ~ SyntaxError {
		if const value = this.toBooleanOrNull() {
			return value
		}
		else {
			throw new SyntaxError(`The string "\(this)" can't be parsed to a boolean`)
		}
	}
}