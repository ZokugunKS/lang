include once ../inc/array

extern Math

impl Array {
	/**[md.zot]**api**
	Returns an object with key-value pairs with key from the given *keys* array and value from *this*.
	
	@class Array
	@function associate
	@param	{array[string]}	keys	The array of keys
	@return	{object}
	
	@example basics
		{{:dokka.get('mocha', 'array instance associate').code()}}
	**/
	associate(keys: Array): Object {
		let obj = {}
		
		for i from 0 til Math.min(this.length, keys.length) {
			obj[keys[i]] = this[i]
		}
		
		return obj
	}
}