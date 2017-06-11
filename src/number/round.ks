include once '../inc/math'
include once '../inc/number'

impl Number {
	/**[md.zot]**api**
	Round the number with the decimal's *precision*.
	
	@function round
	@param	{number}	[precision]		The decimal's precision
	@return {number}
	
	@example basics
		{{:dokka.get('mocha', 'number instance round').code()}}
	**/
	round(precision = 0): Number {
		precision = Math.pow(10, precision).toFixed(0)
		return Math.round(this * precision) / precision
	}
}