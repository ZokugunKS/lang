include {
	'../inc/number'
	'../inc/string'
}

impl String {
	/**[md.zot]**api**
	Converts the string as an integer.

	@function toInt
	@param	{number}	[base]		The base of the integer
	@return {number}

	@example basics
		{{:dokka.get('mocha', 'string instance toInt').code()}}
	**/
	toInt(base: Number = 10): Number ~ ParseError {
		const value = parseInt(this, base)

		if value == NaN {
			throw new ParseError(`The string "\(this)" can't be parsed to an int`)
		}
		else {
			return value
		}
	}
}