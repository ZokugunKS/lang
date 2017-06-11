include once '../inc/number'

impl Number {
	/**[md.zot]**api**
	Limit the number between *min* and *max*.
	
	@function limit
	@param	{number}	min	The minimum number
	@param	{number}	max	The maximum number
	@return {number}
	
	@example basics
		{{:dokka.get('mocha', 'number instance limit').code()}}
	**/
	limit(min, max): Number => isNaN(this) ? min : Math.min(max, Math.max(min, this))
}