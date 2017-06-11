include once '../inc/array'

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
	group(fn, bind = null): Object {
		let result = {}
		
		let key
		for value, index in this {
			key = fn*$(bind, value, index, this)
			
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