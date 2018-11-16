include {
	'../inc/array'
	
	'./filter'
}

impl Array {
	/**[md.zot]**api**
	Returns a copy of the array without null elements.
	
	@class Array
	@function compact
	@return {array}
	
	@example basics
		{{:dokka.get('mocha', 'array instance compact').code()}}
	**/
	compact(): Array => this.filter((item?) => item?)
}