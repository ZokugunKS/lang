include once '../inc/math'
include once '../inc/number'

impl Number {
	/**[md.zot]**api**
	If *min* and *max* are given, returns a number between *min* and *max*. If not, returns a rndom number between 0.0 and 1.0.
	
	@function random
	@param	{number}	[min]	The minimum number
	@param	{number}	[max]	The maximum number
	@return {number}
	@static
	
	@example basics
		{{:dokka.get('mocha', 'number class random').code()}}
	**/
	static randomInt(min: Number, max: Number): Number {
		return Math.floor(Math.random() * (max - min + 1)) + min
	}
}