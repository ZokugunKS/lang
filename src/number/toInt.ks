include once '../inc/number'

impl Number {
	/**[md.zot]**api**
	Returns the number as a integer.
	
	@function toInt
	@param	{number}	[base=10]	The base of the number
	@return {number}
	
	@example basics
		{{:dokka.get('mocha', 'number instance toInt').code()}}
	**/
	toInt(base = 10): Number => parseInt(this, base)
}