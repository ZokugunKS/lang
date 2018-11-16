include '../inc/string'

impl String {
	/**[md.zot]**api**
	Returns an array containing the lines of the string.
	If *emptyLines* is *true*, the empty lines will be also contained in the array.
	
	@function lines
	@param	{boolean} 		[emptyLines]	Should it returns the empty lines
	@return {array[string]}
	
	@example basics
		{{:dokka.get('mocha', 'string instance lines').code()}}
	**/
	lines(emptyLines = false): Array<String> {
		if this.length == 0 {
			return []
		}
		else if emptyLines {
			return this.replace(/\r\n/g, '\n').replace(/\r/g, '\n').split('\n')
		}
		else {
			return this.match(/[^\r\n]+/g) || []
		}
	}
}