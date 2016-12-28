include once ../inc/regexp

impl RegExp {
	/**[md.zot]**api**
	Returns the number of groups defined in the regex.
	
	@function length
	@return {number}
	
	@example basics
		{{:dokka.get('mocha', 'regexp length').code()}}
	**/
	length(): Number => (new RegExp(this.source + '|')).exec('').length - 1
}