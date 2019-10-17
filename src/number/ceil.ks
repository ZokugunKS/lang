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
	ceil(precision: Number = 0): Number {
		if precision == 0 {
			return Math.ceil(this)
		}
		else {
			precision = parseInt(Math.pow(10, precision))

			return Math.ceil(this * precision) / precision
		}
	}
}