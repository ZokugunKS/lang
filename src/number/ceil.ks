include '../inc/math'
include '../inc/number'

impl Number {
	/**[md.zot]**api**
	Ceil the number with the decimal's *precision*.
	
	@function ceil
	@param	{number}	[precision]		The decimal's precision
	@return {number}
	
	@example basics
		{{:dokka.get('mocha', 'number instance ceil').code()}}
	**/
	ceil(precision = 0): Number {
		precision = Math.pow(10, precision).toFixed(0)
		return Math.ceil(this * precision) / precision
	}
}