include once '../inc/math'

impl Math {
	/**[md.zot]**api**
	Limit a value.
	
	@function limit
	@param	{number}	value	The value to limit
	@param	{number}	min		The min limit
	@param	{number}	max		The max limit
	@return {number}
	@static
	
	@example basics
		{{:dokka.get('mocha', 'math limit').code()}}
	**/
	limit(value, min, max): Number => Math.min(max, Math.max(value, min))
}