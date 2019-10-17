include '../inc/math'
include '../inc/number'

impl Number {
	/**[md.zot]**api**
	Round the number with the decimal's *precision*.

	@function round
	@param	{number}	[precision]		The decimal's precision
	@return {number}

	@example basics
		{{:dokka.get('mocha', 'number instance round').code()}}
	**/
	round(precision: Number = 0): Number {
		if precision == 0 {
			return Math.round(this)
		}
		else {
			precision = parseInt(Math.pow(10, precision))

			return Math.round(this * precision) / precision
		}
	}
}