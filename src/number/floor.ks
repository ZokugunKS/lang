include once ../inc/math
include once ../inc/number

impl Number {
	/**[md.zot]**api**
	Floor the number with the decimal's *precision*.
	
	@function floor
	@param	{number}	[precision]		The decimal's precision
	@return {number}
	
	@example basics
		{{:dokka.get('mocha', 'number instance floor').code()}}
	**/
	floor(precision = 0): Number {
		precision = Math.pow(10, precision).toFixed(0)
		return Math.floor(this * precision) / precision
	}
}