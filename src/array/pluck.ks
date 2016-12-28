include once ../inc/array

impl Array {
	/**[md.zot]**api**
	Returns array of values for passed property/method *name* on each member.
	
	@class Array
	@function pluck
	@param 	{string} 	name 	The name
	@return {array}
	
	@example scalars
		{{:dokka.get('mocha', 'array instance pluck :scalar').code()}}
	
	@example functions
		{{:dokka.get('mocha', 'array instance pluck :fn').code()}}
	**/
	pluck(name): Array {
		let result = []
		
		let value
		for item in this when value ?= item?[name] {
			if value is Function {
				result.push(value) if value ?= value*$(item)
			}
			else {
				result.push(value)
			}
		}
		
		return result
	}
}