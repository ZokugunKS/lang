include once ../inc/array

impl Array {
	/**[md.zot]**api**
	Return an array from the value
	
	@class Array
	@function from
	@param	{any}	value	The value to cast
	@return {array}
	@static
	
	@example basics
		{{:dokka.get('mocha', 'array class from :def').code()}}
	**/
	static from(item?): Array {
		if !?item {
			return []
		}
		else if Type.isEnumerable(item) && item is not String {
			return (item is Array) ? item : Array.prototype.slice.call(item)
		}
		else {
			return [item]
		}
	}
}