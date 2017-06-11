include once {
	'../inc/array'
	
	'../object/clone'
}

impl Array {
	/**[md.zot]**api**
	Returns an object with key-value pairs associated if the value checks the condition of the key from *filters*.
	
	@function link
	@param	{object[function]}	filters		The array of filtering functions
	@return {object}
	
	@example basics
		{{:dokka.get('mocha', 'array instance link').code()}}
	**/
	link(filters): Object {
		let keys = Object.clone(filters)
		let result = {}
		
		let key
		for i from 0 til this.length {
			for key of keys when keys[key](this[i]) {
				result[key] = this[i]
				
				delete keys[key]
				
				break
			}
		}
		
		return result
	}
}