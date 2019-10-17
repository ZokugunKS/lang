include '../inc/array'

impl Array {
	/**[md.zot]**api**
	Return an object where each key is the group name and the value is the elements form the array that fit in that group.

	@function group
	param 	{function} 	fn 		The grouping function
	@param 	{object} 	[bind] 	The object to use as 'this' within the function.
	@return {object}

	@example basics
		{{:dokka.get('mocha', 'array instance group').code()}}
	**/
	group(fn: Function, bind = null): Dictionary {
		const result = {}

		for const value, index in this {
			const key = fn*$(bind, value, index, this)

			if result[key] is Array {
				result[key].push(value)
			}
			else {
				result[key] = [value]
			}
		}

		return result
	}
}