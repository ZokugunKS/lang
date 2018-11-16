include '../inc/array'

impl Array {
	/**[md.zot]**api**
	Returns *true* if the array contains any value of the given array.
	
	@class Array
	@function containsAny
	@param	{array}		items	The list of items to search for
	@return {boolean}
	
	@example basics
		{{:dokka.get('mocha', 'array instance containsAny').code()}}
	**/
	containsAny(items): Boolean {
		for item in items {
			return true if this.indexOf(item) != -1
		}
		
		return false
	}
}