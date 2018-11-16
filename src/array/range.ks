include {
	'../inc/array'
	'../inc/math'
}

impl Array {
	/**[md.zot]**api**
	Returns a new array
	
	@function range
	@param	{number}	[start]
	@param	{number}	stop
	@param	{number}	[step]
	@return {array}
	@static
	
	@example basics
		{{:dokka.get('mocha', 'array class range :0:4:2').code()}}
	**/
	static range(): Array => []
	static range(start = 0, stop, step = 1): Array { // {{{
		let length = Math.max(Math.ceil((stop - start) / step), 0)
		let result = new Array(length)
		
		for i from 0 til length {
			result[i] = start
			
			start += step
		}
		
		return result
	} // }}}
}