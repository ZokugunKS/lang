include once '../inc/array'

impl Array {
	/**[md.zot]**api**
	Returns the first value that is not null.
	
	@function pick
	@return {any}
	
	@example basics
		{{:dokka.get('mocha', 'array instance pick').code()}}
	**/
	pick() {
		for item in this when item != null {
			return item
		}
		
		return null
	}
}

export Array