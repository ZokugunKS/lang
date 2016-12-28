include once ../inc/array

impl Array {
	/**[md.zot]**api**
	Returns *true* if the array contains the given value.
	
	@class Array
	@function contains
	@param	{any}		item	The item to search for
	@param	{number}	[from]	The index at which to start the search
	@return {boolean}
	
	@example basics
		{{:dokka.get('mocha', 'array instance contains').code()}}
	**/
	contains(item, from = 0): Boolean {
		return this.indexOf(item, from) != -1
	}
}