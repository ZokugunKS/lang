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
	uniq(sorted = false, fn = null, bind = null): Array {
		let result: Array = []
		let value
		
		if sorted {
			let seen = null
			
			if fn? {
				for i from 0 til this.length {
					value = fn*$(bind, this[i], i, this)
					
					if !i || seen != value {
						result.push(this[i])
						seen = value
					}
				}
			}
			else {
				for value, i in this {
					if !i || seen != value {
						result.push(value)
						seen = value
					}
				}
			}
		}
		else {
			if fn? {
				let seen: Array = []
				
				for i from 0 til this.length {
					value = fn*$(bind, this[i], i, this)
					
					if !i || !seen.contains(value) {
						result.push(this[i])
						seen.push(value)
					}
				}
			}
			else {
				for value, i in this {
					if !i || !result.contains(value) {
						result.push(value)
					}
				}
			}
		}
		
		return result
	}
}