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
	toIntOrNull(base: Number = 10): Number? {
		const value = parseInt(this, base)

		if value == NaN {
			return null
		}
		else {
			return value
		}
	}
}