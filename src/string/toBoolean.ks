include './toBooleanOrNull'

impl String {
	/**[md.zot]**api**
	Converts the string as a boolean.

	@function toBoolean
	@return {boolean}

	@example basics
		{{:dokka.get('mocha', 'string instance toBoolean').code()}}
	**/
	toBoolean(): Boolean ~ ParseError {
		if const value = this.toBooleanOrNull() {
			return value
		}
		else {
			throw new ParseError(`The string "\(this)" can't be parsed to a boolean`)
		}
	}
}