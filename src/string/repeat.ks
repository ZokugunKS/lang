include '../inc/string'

#[if(any(jsc-v8, trident))]
impl String {
	/**[md.zot]**api**
	Returns a string compose of the string repated *count* times.

	@function repeat
	@param	{number} 	count 	The number of times to repeat the string
	@return {string}

	@example basics
		{{:dokka.get('mocha', 'string instance repeat').code()}}
	**/
	repeat(count: Number): String {
		let result = ''
		let pattern = this

		while count > 0  {
			if count & 1 {
				result += pattern
			}

			count >>= 1

			pattern += pattern
		}

		return result
	}
}

#[else]
disclose String {
	repeat(count: Number): String
}