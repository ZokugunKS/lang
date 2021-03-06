include '../inc/array'

impl Array {
	/**[md.zot]**api**
	Returns the last element of the array.

	@class Array
	@function last
	@param	{number}	[index=1]	The index from last
	@return {any}

	@example basics
		{{:dokka.get('mocha', 'array instance last').code()}}
	**/
	last(index: Number = 1) {
		return this.length != 0 ? this[this.length - index] : null
	}
}