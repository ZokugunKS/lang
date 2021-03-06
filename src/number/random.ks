include '../inc/math'
include '../inc/number'

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
	static random(): Number {
		return Math.random()
	}
	static random(min: Number, max: Number): Number {
		return Math.random() * (max - min) + min
	}
}