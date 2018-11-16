include '../inc/math'
include '../inc/number'

impl Number {
	/**[md.zot]**api**
	Returns *false* if the number is between *min* and *max*, *true* if not.
	
	@function beyond
	@param	{number}	min	The minimum number
	@param	{number}	max	The maximum number
	@return {boolean}
	
	@example basics
		{{:dokka.get('mocha', 'number instance beyond').code()}}
	**/
	beyond(min: Number, max: Number): Boolean {
		return this < min || this > max
	}
}