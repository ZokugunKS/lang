include once '../inc/string'

impl String {
	/**[md.zot]**api**
	Returns the first expression opened with the matching pair *open* and *close*, like *(*, *)* or *[*, *]*.
	
	@function matchPair
	@param	{string}	open		The string that opens an expression
	@param	{string}	close		The string that closes an expression
	@return {object}
	
	@example basics
		{{:dokka.get('mocha', 'string instance matchPair :default').code()}}
	**/
	matchPair(open, close): Boolean | Object {
		let level = 0
		let start = -1
		
		for i from 0 til this.length {
			if this[i] == open {
				if start == -1 {
					start = i
				}
				
				level++
			}
			else if this[i] == close {
				if --level == 0 {
					return {
						before: this.substr(0, start)
						body: this.substring(start + 1, i)
						after: this.slice(i + 1)
						begin: start
						end: i
					}
				}
			}
		}
		
		return false
	}
}