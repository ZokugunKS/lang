include {
	'../inc/number'
	'../inc/string'
}

impl String {
	/**[md.zot]**api**
	Converts the string as a float.

	@function toFloat
	@return {number}

	@example basics
		{{:dokka.get('mocha', 'string instance toFloat').code()}}
	**/
	toFloat(): Number ~ ParseError {
		const value = parseFloat(this)

		if value == NaN {
			throw new ParseError(`The string "\(this)" can't be parsed to a float`)
		}
		else {
			return value
		}
	}
}