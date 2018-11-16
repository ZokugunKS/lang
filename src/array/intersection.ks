include '../inc/array'

impl Array {
	/**[md.zot]**api**
	Returns the intersection between the current array and the given arrays
	
	@function intersection
	@param	{array}	'...	The arrays to intersect'
	@return	{array}
	
	@example basics
		{{:dokka.get('mocha', 'array instance intersection').code()}}
	**/
	intersection(...args): Array {
		let result = []
		
		let j, seen
		for value in this {
			seen = true
			
			for j from 0 til args.length while seen {
				seen = false if args[j].indexOf(value) == -1
			}
			
			result.push(value) if seen
		}
		
		return result
	}
}