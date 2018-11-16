include '../inc/array'

impl Array {
	/**[md.zot]**api**
	Remove all values from the array.
	
	@class Array
	@function clear
	@return {this}
	
	@example basics
		{{:dokka.get('mocha', 'array instance clear').code()}}
	**/
	clear(): Array {
		this.length = 0
		
		return this
	}
}