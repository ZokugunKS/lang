include {
	'../inc/array'

	'./contains'
	'./clear'
}

impl Array {
	/**[md.zot]**api**
	Returns a copy of the array without duplicate elements.

	@function uniq
	@param	{boolean}		[sorted]	Flag the array as sorted
	@param 	{function} 		[fn] 		The function to test for each element.
	@param 	{object} 		[bind] 		The object to use as 'this' within the function.
	@return {array}

	@example basics
		{{:dokka.get('mocha', 'array instance uniq :false:nf').code()}}

	@example complex
		{{:dokka.get('mocha', 'array instance uniq :true:fn').code()}}
	**/
	uniq(sorted: Boolean = false, fn: Function = null, bind = null): Array {
		const result = []

		if sorted {
			let seen = null

			if fn != null {
				for const i from 0 til this.length {
					const value = fn*$(bind, this[i], i, this)

					if i == 0 || seen != value {
						result.push(this[i])
						seen = value
					}
				}
			}
			else {
				for const value, i in this {
					if i == 0 || seen != value {
						result.push(value)
						seen = value
					}
				}
			}
		}
		else {
			if fn != null {
				const seen = []

				for const i from 0 til this.length {
					const value = fn*$(bind, this[i], i, this)

					if i == 0 || !seen.contains(value) {
						result.push(this[i])
						seen.push(value)
					}
				}
			}
			else {
				for const value, i in this {
					if i == 0 || !result.contains(value) {
						result.push(value)
					}
				}
			}
		}

		return result
	}
}