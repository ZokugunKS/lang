include '../inc/math'
include '../inc/number'

impl Number {
	/**[md.zot]**api**
	Floor the number with the decimal's *precision*.

	@function floor
	@param	{number}	[precision]		The decimal's precision
	@return {number}

	@example basics
		{{:dokka.get('mocha', 'number instance floor').code()}}
	**/
	floor(precision: Number = 0): Number {
		if precision == 0 {
			return Math.floor(this)
		}
		else {
			precision = parseInt(Math.pow(10, precision))

			return Math.floor(this * precision) / precision
		}
	}
}