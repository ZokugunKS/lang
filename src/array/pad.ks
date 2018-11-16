include './copy'

impl Array {
	/**[md.zot]**api**
	Returns a copy of the array padded with *value* until the *length*.
	
	@function pad
	@param 	{number} 	length 		The new length of the array
	@param 	{any} 		value	 	The value to pad with
	@return	{array}
	
	@example basics
		{{:dokka.get('mocha', 'array instance pad').code()}}
	**/
	pad(length: Number, value): Array {
		let result = this.copy()
		
		if length < 0 {
			if -length > this.length {
				for i from this.length til -length {
					result.unshift(value)
				}
			}
		}
		else {
			if length > this.length {
				for i from this.length til length {
					result.push(value)
				}
			}
		}
		
		return result
	}
}

export Array