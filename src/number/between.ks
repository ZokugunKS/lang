include once '../inc/math'
include once '../inc/number'

impl Number {
	/**[md.zot]**api**
	Returns *true* if the number is between *min* and *max*, *false* if not.
	
	@function between
	@param	{number}	min	The minimum number
	@param	{number}	max	The maximum number
	@return {boolean}
	
	@example basics
		{{:dokka.get('mocha', 'number instance between').code()}}
	**/
	between(min: Number, max: Number): Boolean {
		return this >= min && this <= max
	}
}