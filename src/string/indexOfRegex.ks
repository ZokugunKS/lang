include '../inc/string'

impl String {
	/**[md.zot]**api**
	Returns the index of the match by the *pattern*, -1 if not match.
	
	@function indexOfRegex
	@param	{regex}		pattern		The pattern to match
	@param	{number}	[from]		The index from which to start to match
	@return {number}
	
	@example basics
		{{:dokka.get('mocha', 'string instance indexOfRegex :default').code()}}
	**/
	indexOfRegex(pattern, from = 0): Number {
		let index = this.substring(from).search(pattern)
		return index >= 0 ? index + from : -1
	}
}